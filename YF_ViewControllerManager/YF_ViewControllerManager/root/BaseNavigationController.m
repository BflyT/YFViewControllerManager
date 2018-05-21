//
//  BaseNavigationController.m
//  Demo
//
//  Created by Redpower on 2017/2/15.
//  Copyright © 2017年 Redpower. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIBarButtonItem+ZMExtension.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

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
