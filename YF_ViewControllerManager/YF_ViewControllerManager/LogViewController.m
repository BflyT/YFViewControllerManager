//
//  LogViewController.m
//  YF_ViewControllerManager
//
//  Created by jyzx101 on 2018/5/21.
//  Copyright © 2018年 jyzx. All rights reserved.
//

#import "LogViewController.h"
#import "CyanViewController.h"

@interface LogViewController ()

@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"登录";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CyanViewController *cyanVC = [[CyanViewController alloc] init];
    [self.navigationController pushViewController:cyanVC animated:YES];
}

@end
