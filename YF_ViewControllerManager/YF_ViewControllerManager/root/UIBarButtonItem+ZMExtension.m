//
//  UIBarButtonItem+ZMExtension.m
//  Zimu
//
//  Created by Redpower on 2017/2/23.
//  Copyright © 2017年 Zimu. All rights reserved.
//

#import "UIBarButtonItem+ZMExtension.h"

@implementation UIBarButtonItem (ZMExtension)

+ (instancetype)barButtonItemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title.length != 0) {
        //1、有文字，没图片
        //设置标题
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //计算button宽度
        UIFont *font = [UIFont systemFontOfSize:16];
        if ([UIScreen mainScreen].bounds.size.width > 375) {
            font = [UIFont systemFontOfSize:24];
        }
        CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:font}];
        button.bounds = CGRectMake(0, 0, size.width, size.height);
        
    }else{
        //2、没文字，有图片
        //设置按钮图片
        if (imageName.length != 0) {
            [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            NSString *highLightImageName = [imageName stringByAppendingString:@"-click"];
            [button setImage:[UIImage imageNamed:highLightImageName] forState:UIControlStateHighlighted];
            button.bounds = CGRectMake(0, 0, button.currentImage.size.width, button.currentImage.size.height);
        }
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}


+ (instancetype)backBarButtonItemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //标题
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    //图片
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    NSString *highLightImageName = [imageName stringByAppendingString:@"-click"];
    [button setImage:[UIImage imageNamed:highLightImageName] forState:UIControlStateHighlighted];
    
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [button setContentEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    
    button.bounds = CGRectMake(0, 0, button.currentImage.size.width + 80, button.currentImage.size.height);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
