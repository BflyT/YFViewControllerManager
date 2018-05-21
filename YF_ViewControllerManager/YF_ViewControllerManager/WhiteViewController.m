//
//  WhiteViewController.m
//  YF_ViewControllerManager
//
//  Created by jyzx101 on 2018/5/21.
//  Copyright © 2018年 jyzx. All rights reserved.
//

#import "WhiteViewController.h"

#import "LogViewController.h"
#import "LoginNavViewController.h"

@interface WhiteViewController ()

@end

@implementation WhiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"white";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    LoginNavViewController *loginVC = [[LoginNavViewController alloc] initWithRootViewController:[[LogViewController alloc] init]];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
