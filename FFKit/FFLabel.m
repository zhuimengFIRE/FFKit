//
//  FFLabel.m
//  FFKit
//
//  Created by 方超 on 2020/6/16.
//  Copyright © 2020 GTion. All rights reserved.
//

#import "FFLabel.h"

@implementation FFLabel

+ (FFLabel *)labelWithFrame:(CGRect)frame
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor {
    FFLabel *label = [[FFLabel alloc] initWithFrame:frame];
    if (font) {
        label.font = font;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    return label;
}


+ (FFLabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor {
    FFLabel *label = [[FFLabel alloc] initWithFrame:frame];
    if (text) {
        label.text = text;
    }
    if (font) {
        label.font = font;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    return label;
}

+ (FFLabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
                  alignment:(NSTextAlignment)alignment {
    FFLabel *label = [[FFLabel alloc] initWithFrame:frame];
    if (text) {
        label.text = text;
    }
    if (font) {
        label.font = font;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    label.textAlignment = alignment;
    return label;
}

+ (FFLabel *)labelWithFrame:(CGRect)frame
                       text:(NSString *)text
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
                  alignment:(NSTextAlignment)alignment
               cornerRadius:(NSInteger)cornerRadius {
    FFLabel *label = [[FFLabel alloc] initWithFrame:frame];
    if (text) {
        label.text = text;
    }
    if (font) {
        label.font = font;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (cornerRadius>0) {
        label.layer.cornerRadius = cornerRadius;
        label.layer.masksToBounds = YES;
    }
    label.textAlignment = alignment;
    return label;
}


+ (FFLabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment cornerRadius:(NSInteger)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    FFLabel *label = [[FFLabel alloc] initWithFrame:frame];
    if (text) {
        label.text = text;
    }
    if (font) {
        label.font = font;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (cornerRadius>0) {
        label.layer.cornerRadius = cornerRadius;
        label.layer.masksToBounds = YES;
    }
    if (borderColor && borderWidth>0) {
        label.layer.borderWidth = borderWidth;
        label.layer.borderColor = borderColor.CGColor;
    }
    label.textAlignment = alignment;
    return label;
}

+ (FFLabel *)labelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment cornerRadius:(NSInteger)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth backgroundColor:(nonnull UIColor *)backgroundColor{
    FFLabel *label = [[FFLabel alloc] initWithFrame:frame];
    if (text) {
        label.text = text;
    }
    if (font) {
        label.font = font;
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (cornerRadius>0) {
        label.layer.cornerRadius = cornerRadius;
        label.layer.masksToBounds = YES;
    }
    if (borderColor && borderWidth>0) {
        label.layer.borderWidth = borderWidth;
        label.layer.borderColor = borderColor.CGColor;
    }
    if (backgroundColor) {
        label.backgroundColor = backgroundColor;
    }
    label.textAlignment = alignment;
    return label;
}


@end
