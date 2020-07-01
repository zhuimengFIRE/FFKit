//
//  FFButton.m
//  FFKit
//
//  Created by 方超 on 2020/7/1.
//  Copyright © 2020 GTion. All rights reserved.
//

#import "FFButton.h"

@interface FFButton ()

@property (nonatomic, copy) buttonBackBlock backBlock;

@end

@implementation FFButton

+ (FFButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
                         font:(UIFont *)font
                   titleColor:(UIColor *)titleColor
              backgroundColor:(UIColor *)backgroundColor
                        block:(buttonBackBlock)block {
    FFButton *button = [FFButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (font) {
        button.titleLabel.font = font;
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (backgroundColor) {
        [button setBackgroundColor:backgroundColor];
    }
    button.backBlock = block;
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (FFButton *)buttonWithFrame:(CGRect)frame block:(buttonBackBlock)block {
    FFButton *button = [FFButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backBlock = block;
    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}


- (void)buttonClick:(FFButton *)sender {
    if (sender.backBlock) {
        sender.backBlock(sender);
    }
}

@end
