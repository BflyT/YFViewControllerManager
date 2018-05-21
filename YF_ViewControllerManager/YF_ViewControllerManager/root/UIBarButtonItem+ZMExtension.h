//
//  UIBarButtonItem+ZMExtension.h
//  Zimu
//
//  Created by Redpower on 2017/2/23.
//  Copyright © 2017年 Zimu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZMExtension)

//自定义导航栏上的按钮：leftBarButton、rightBarButton
+ (instancetype)barButtonItemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action;

//自定义push出的childController左上角的返回按钮
+ (instancetype)backBarButtonItemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action;


@end
