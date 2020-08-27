//
//  FFCutImage.m
//  test
//
//  Created by Playboy on 2018/11/12.
//  Copyright © 2018 ffang. All rights reserved.
//

#import "FFCutImage.h"

@implementation FFCutImage

#pragma mark 获取当前屏幕的截图
+(UIImage *) getCurrentScreenShot
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *) getCurrentViewShot:(UIView *) view
{
    CGSize size = view.frame.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+(UIImage *) getCurrentScrollviewShot:(UIScrollView *) scrollview
{
    CGSize size = scrollview.contentSize;
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    
    //获取当前scrollview的frame 和 contentOffset
    CGRect saveFrame = scrollview.frame;
    CGPoint saveOffset = scrollview.contentOffset;
    //置为起点
    scrollview.contentOffset = CGPointZero;
    scrollview.frame = CGRectMake(0, 0, scrollview.contentSize.width, scrollview.contentSize.height);
    
    [scrollview.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //还原
    scrollview.frame = saveFrame;
    scrollview.contentOffset = saveOffset;
    
    return image;
}

//获得某个范围内的屏幕图像
+ (UIImage *) getCurrentInnerViewShot: (UIView *) innerView atFrame:(CGRect)rect
{
    UIGraphicsBeginImageContext(innerView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(rect);
    [innerView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  theImage;
}

-(UIImage *)scaleImage:(UIImage *)image toKb:(NSInteger)kb{
    
    if (!image) {
        return image;
    }
    if (kb<1) {
        return image;
    }
    
    kb *= 1024;
    
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > kb && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    NSLog(@"当前大小:%fkb",(float)[imageData length]/1024.0f);
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}
@end
