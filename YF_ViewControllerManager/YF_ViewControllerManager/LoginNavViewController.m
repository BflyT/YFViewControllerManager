//
//  LoginNavViewController.m
//  YF_ViewControllerManager
//
//  Created by jyzx101 on 2018/5/21.
//  Copyright © 2018年 jyzx. All rights reserved.
//

#import "LoginNavViewController.h"

@interface LoginNavViewController ()

@end

@implementation LoginNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏栏标题字体
    UIFont *font = [UIFont systemFontOfSize:18.f];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : font,
                                     NSForegroundColorAttributeName : [UIColor blackColor]
                                     };
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
    
}
@end
