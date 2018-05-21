//
//  RootTabBarController.m
//  Zimu
//
//  Created by Redpower on 2017/2/23.
//  Copyright © 2017年 Zimu. All rights reserved.
//

#import "RootTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "StarsViewController.h"
#import "MineViewController.h"
#import "UIImage+ZMExtension.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self addChildVCs];
    
    //设置tabbar背景图
//    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    
}

/*
 *  添加子控制器
 *
 *  title : 控制器tabbar标题
 *  imageName  :  taabbr图片
 */
- (void)setupChildViewController:(UIViewController *)viewController Title:(NSString *)title imageName:(NSString *)imageName{
    
    BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:viewController];
    viewController.title = title;
    
    NSString *selectImageName = [imageName stringByAppendingString:@"_selected"];
    [viewController.tabBarItem setImage:[UIImage imageNamed:imageName]];
    UIImage *selectImage = [UIImage originalImageWithImageName:selectImageName];
    [viewController.tabBarItem setSelectedImage:selectImage];
    
    [self addChildViewController:navi];
}

- (void)addChildVCs{
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    [self setupChildViewController:homeVC Title:@"首页" imageName:@"tabbar_home"];
    
    StarsViewController *starsVC = [[StarsViewController alloc] init];
    [self setupChildViewController:starsVC Title:@"明星" imageName:@"tabbar_stars"];

    MineViewController *mineVC = [[MineViewController alloc]init];
    [self setupChildViewController:mineVC Title:@"我的" imageName:@"tabbar_mine"];
}

@end
