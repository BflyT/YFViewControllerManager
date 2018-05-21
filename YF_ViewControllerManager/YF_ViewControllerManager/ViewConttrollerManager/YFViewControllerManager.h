//
//  YFViewControllerManager.h
//  mxx
//
//  Created by 飞飞飞 on 2018/5/19.
//  Copyright © 2018年 飞飞飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YFViewControllerManager : NSObject

+ (instancetype)sharedInstance;

- (void)yf_closeAllViewControllers:(UIViewController *)nowVC ;

- (UIViewController*)yf_curTopViewController;

@end
