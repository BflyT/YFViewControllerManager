//
//  CyanViewController.m
//  YF_ViewControllerManager
//
//  Created by jyzx101 on 2018/5/21.
//  Copyright © 2018年 jyzx. All rights reserved.
//

#import "CyanViewController.h"
#import "BackViewController.h"

@interface CyanViewController ()

@end

@implementation CyanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"cyan";
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BackViewController *backVC = [[BackViewController alloc] init];
    [self presentViewController:backVC animated:YES completion:nil];
}

@end
