//
//  FFCutImage.h
//  test
//
//  Created by Playboy on 2018/11/12.
//  Copyright © 2018 ffang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFCutImage : NSObject

/**
 获取屏幕截图
 */
+(UIImage *) getCurrentScreenShot;

/**
 获取某个view 上的截图
 */
+(UIImage *) getCurrentViewShot:(UIView *) view;

/**
 获取某个scrollview 上的截图
 */
+(UIImage *) getCurrentScrollviewShot:(UIScrollView *) scrollview;

/**
 获取某个 范围内的 截图
 */
+ (UIImage *) getCurrentInnerViewShot: (UIView *) innerView atFrame:(CGRect)rect;

/**
 压缩图片到指定大小
 */
-(UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb;

@end

NS_ASSUME_NONNULL_END
