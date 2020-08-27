//
//  UIApplication+FFVisible.m
//  UKEX
//
//  Created by 方超 on 2019/4/12.
//  Copyright © 2019 ffang. All rights reserved.
//

#import "UIApplication+FFVisible.h"

@implementation UIApplication (FFVisible)
- (UIWindow *)mainWindow {
    return self.delegate.window;
}

- (UIViewController *)visibleViewController {
    UIViewController *rootViewController = [self.mainWindow rootViewController];
    return [self getVisibleViewControllerFrom:rootViewController];
}

- (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
    
}

- (UINavigationController *)visibleNavigationController {
    return [[self visibleViewController] navigationController];
}
@end
