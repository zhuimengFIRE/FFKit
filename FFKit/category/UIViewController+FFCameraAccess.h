//
//  UIViewController+FFCameraAccess.h
//  UKEX
//
//  Created by 方超 on 2020/5/9.
//  Copyright © 2020 ffang. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FFCameraAccess)

/**
 * 是否获得相机权限
 *
 * return YES 已授权
 */
- (BOOL)judgeTheCameraAccess;

@end

NS_ASSUME_NONNULL_END
