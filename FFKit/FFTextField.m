//
//  FFTextField.m
//  FFKit
//
//  Created by 方超 on 2020/7/1.
//  Copyright © 2020 GTion. All rights reserved.
//

#import "FFTextField.h"

@implementation FFTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:placeholder];
    [self reloadPlaceholder];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self reloadPlaceholder];
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    _placeholderFont = placeholderFont;
    [self reloadPlaceholder];
}

- (void)reloadPlaceholder {
    NSString *text = self.placeholder?self.placeholder:@"";
    UIColor *placeholderColor = self.placeholderColor ? self.placeholderColor : [UIColor lightGrayColor];
    UIFont *placeholderFont = self.placeholderFont ? self.placeholderFont : self.font;
    NSAttributedString *attr = [[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName:placeholderColor,NSFontAttributeName:placeholderFont}];
    self.attributedPlaceholder = attr;
}

- (void)textFieldDidChange:(UITextField *)textField {
    if (textField.text.length > 0) {
        // 多个小数点处理
        if ([textField.text componentsSeparatedByString:@"."].count > 2) {
            textField.text = [textField.text substringToIndex:textField.text.length-1];
        }
        if ([textField.text componentsSeparatedByString:@"."].count == 2 && [[textField.text componentsSeparatedByString:@"."] lastObject].length > self.round) {
            NSString *firstString = [[textField.text componentsSeparatedByString:@"."] firstObject];
            NSString *lastString = [[textField.text componentsSeparatedByString:@"."] lastObject];
            textField.text = [NSString stringWithFormat:@"%@.%@",firstString,[lastString substringToIndex:self.round]];
        }
    }
}

@end
