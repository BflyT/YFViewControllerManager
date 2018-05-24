//
//  HomeViewController.m
//  YF_ViewControllerManager
//
//  Created by jyzx101 on 2018/5/21.
//  Copyright © 2018年 jyzx. All rights reserved.
//

#import "HomeViewController.h"
#import "WhiteViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    self.tabBarController.tabBar.hidden = NO;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    WhiteViewController *whitevc = [[WhiteViewController alloc] init];
//    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:whitevc animated:YES];
}

@end
