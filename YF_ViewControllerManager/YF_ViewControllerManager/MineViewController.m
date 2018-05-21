//
//  MineViewController.m
//  YF_ViewControllerManager
//
//  Created by jyzx101 on 2018/5/21.
//  Copyright © 2018年 jyzx. All rights reserved.
//

#import "MineViewController.h"
#import "LogViewController.h"
#import "LoginNavViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    LoginNavViewController *loginVC = [[LoginNavViewController alloc] initWithRootViewController:[[LogViewController alloc] init]];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
