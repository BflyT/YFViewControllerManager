//
//  YFViewControllerManager.m
//  mxx
//
//  Created by 飞飞飞 on 2018/5/19.
//  Copyright © 2018年 飞飞飞. All rights reserved.
//

#import "YFViewControllerManager.h"

@implementation YFViewControllerManager

//这里的参数 是随手写的，如果要自定义动画速度可以调整这两个参数
static int presentCount = 0;
static int pushCount = 0;

static float dismissSpeed = 0.2;
static float popSpeed = 0.25;

+ (instancetype)sharedInstance{
    static YFViewControllerManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    presentCount = 0;
    pushCount = 0;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)yf_closeAllViewControllers:(UIViewController *)nowVC {
    UIViewController *curVC = nowVC;
    
    //这一步判断是为了防止递归循环，一般没人会写30个界面跳转吧
    if (presentCount + pushCount > 30) {
        return;
    }
    //首先如果在根控制器则不用返回
    if ([curVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *rootVC = (UITabBarController *)curVC;
        
        //这里要做一些处理，因为在实际测试中会发现dismiss之后，curVC会是tabbar，但是并没有真正返回到tabbar，故此处需要重新校验是否已经结束
        //具体的逻辑需要根据实际业务架构来调整
        if (rootVC.childViewControllers[rootVC.selectedIndex].childViewControllers.count > 1) {
//            NSLog(@"%@---- %d -----%d   4", [curVC class], presentCount, pushCount);
            return [self yf_closeAllViewControllers:rootVC.childViewControllers[rootVC.selectedIndex]];
        }
        if ([rootVC.childViewControllers[rootVC.selectedIndex].childViewControllers.lastObject presentingViewController]){
            return [self yf_closeAllViewControllers:rootVC.childViewControllers[rootVC.selectedIndex].childViewControllers.lastObject];
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((dismissSpeed*presentCount + popSpeed*pushCount) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [rootVC setSelectedIndex:0];
            NSLog(@"%@---- %d -----%d    1", [curVC class], presentCount, pushCount);
            return;
        });
    }
    //如果是nav，则pop回最底层，先处理nav。
    //为什么？
    //因为如果要有nav的返回动画就不能先dismiss，nav有可能就是present出来的
    if ([curVC isKindOfClass:[UINavigationController class]] && curVC.childViewControllers.count > 1) {
        pushCount ++;
//        NSLog(@"%@---- pr: %d ----- pu: %d    2", [curVC class], presentCount, pushCount);
        UINavigationController *nav = (UINavigationController *)curVC;
        [nav popViewControllerAnimated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((dismissSpeed*presentCount + popSpeed*pushCount) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            return [self yf_closeAllViewControllers:nav];
        });
    }
    //最后处理模态
    //为什么？
    //原因同上
    if (curVC.presentingViewController) {
        presentCount ++;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((dismissSpeed*presentCount + popSpeed*pushCount) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [curVC dismissViewControllerAnimated:YES completion:nil];
            return [self yf_closeAllViewControllers:[curVC presentingViewController]];
        });
    }
}

//获取当前显示的VC
- (UIViewController*)yf_curTopViewController{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    return [self topViewControllerWithRootViewController:window.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController1 = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController1.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

@end
