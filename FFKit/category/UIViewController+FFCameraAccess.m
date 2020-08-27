//
//  UIViewController+FFCameraAccess.m
//  UKEX
//
//  Created by 方超 on 2020/5/9.
//  Copyright © 2020 ffang. All rights reserved.
//

#import "UIViewController+FFCameraAccess.h"
#import <Photos/Photos.h>

@implementation UIViewController (FFCameraAccess)

- (BOOL)judgeTheCameraAccess {
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"请在iPhone的“设置”-“隐私”-“相机”功能中，找到“UKEX”打开相机访问权限" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];
        return NO;
    }
    
    return YES;
}

@end
