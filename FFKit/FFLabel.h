//
//  FFLabel.h
//  FFKit
//
//  Created by 方超 on 2020/6/16.
//  Copyright © 2020 GTion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFLabel : UILabel

/**
 * 初始化Label
 * frame font textcolor
 * __nullable 参数可传nil
 * __nonnull  参数不可传nil
 */
+ (FFLabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont * __nullable)font
                  textColor:(UIColor * __nullable)textColor;


/**
* 初始化Label
* frame text font textcolor
*/
+ (FFLabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor;

/**
* 初始化Label
* frame text font textcolor alignment
*/
+ (FFLabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
                  alignment:(NSTextAlignment)alignment;

/**
* 初始化Label
* frame text font textcolor alignment cornerRadius
*/
+ (FFLabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
                  alignment:(NSTextAlignment)alignment
               cornerRadius:(NSInteger)cornerRadius;

/**
* 初始化Label
* frame text font textcolor alignment cornerRadius borderColor borderWidth
*/
+ (FFLabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
                  alignment:(NSTextAlignment)alignment
               cornerRadius:(NSInteger)cornerRadius
                borderColor:(UIColor *)borderColor
                borderWidth:(CGFloat)borderWidth;

/**
* 初始化Label
* frame text font textcolor alignment cornerRadius borderColor borderWidth backgroundColor
*/
+ (FFLabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
                  alignment:(NSTextAlignment)alignment
               cornerRadius:(NSInteger)cornerRadius
                borderColor:(UIColor *)borderColor
                borderWidth:(CGFloat)borderWidth
            backgroundColor:(UIColor *)backgroundColor;




@end

NS_ASSUME_NONNULL_END
