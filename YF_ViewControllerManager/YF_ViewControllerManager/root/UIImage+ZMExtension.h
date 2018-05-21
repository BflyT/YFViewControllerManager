//
//  UIImage+ZMExtension.h
//  Zimu
//
//  Created by Redpower on 2017/2/23.
//  Copyright © 2017年 Zimu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZMExtension)


/**
 *   取消图片渲染效果
 */
+ (UIImage *)originalImageWithImageName:(NSString *)imageName;


/**
 *   颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 *   图片圆角
 */
- (UIImage *)imageAddCornerWithRadious:(CGFloat)cornerRadious size:(CGSize)size;

//给指定角绘制圆角
- (UIImage *)imageAddCornerWithRadious:(CGFloat)cornerRadious size:(CGSize)size byRoundingCorners:(UIRectCorner)corners;

/**
*    高斯模糊
*/
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
/**
 *    修改image大小
 */
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

@end
