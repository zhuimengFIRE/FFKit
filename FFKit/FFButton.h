//
//  FFButton.h
//  FFKit
//
//  Created by 方超 on 2020/7/1.
//  Copyright © 2020 GTion. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^buttonBackBlock)(UIButton *button);

@interface FFButton : UIButton

/**
 * 初始化button
 * __nullable 参数可传nil
 * __nonnull  参数不可传nil
 */
+ (FFButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString * __nonnull)title
                         font:(UIFont * __nullable)font
                   titleColor:(UIColor * __nullable)titleColor
              backgroundColor:(UIColor * __nullable)backgroundColor
                        block:(buttonBackBlock)block;


+ (FFButton *)buttonWithFrame:(CGRect)frame
                        block:(buttonBackBlock)block;
@end

NS_ASSUME_NONNULL_END
