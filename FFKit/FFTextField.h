//
//  FFTextField.h
//  FFKit
//
//  Created by 方超 on 2020/7/1.
//  Copyright © 2020 GTion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FFTextField : UITextField

// 占位符颜色
@property (nonatomic, strong) UIColor *placeholderColor;

// 站位符字体
@property (nonatomic, strong) UIFont *placeholderFont;

// 控制精度范围 可输入小数位数
@property (nonatomic, assign) NSInteger round;

@end

NS_ASSUME_NONNULL_END
