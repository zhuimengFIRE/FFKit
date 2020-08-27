//
//  NSArray+FFEmptyHandle.m
//  UKEX
//
//  Created by 方超 on 2019/12/23.
//  Copyright © 2019 ffang. All rights reserved.
//

#import "NSArray+FFEmptyHandle.h"
#import <objc/runtime.h>
#import "NSObject+FFSwizzleMethod.h"


@implementation NSArray (FFEmptyHandle)
/**
 *  防止数组越界
 */
- (id)objectAtIndexVerify:(NSUInteger)index{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }else{
        return nil;
    }
}
/**
 *  防止数组越界
 */
- (id)objectAtIndexedSubscriptVerify:(NSUInteger)idx{
    if (idx < self.count) {
        return [self objectAtIndexedSubscript:idx];
    }else{
        return nil;
    }
}

+(void)load{
    [super load];
    //无论怎样 都要保证方法只交换一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //交换NSArray中的objectAtIndex方法
        [objc_getClass("__NSArrayI") SystemSelector:@selector(objectAtIndex:) swizzledSelector:@selector(sxy_objectAtIndex:) error:nil];
        //交换NSArray中的objectAtIndexedSubscript方法
        [objc_getClass("__NSArrayI") SystemSelector:@selector(objectAtIndexedSubscript:) swizzledSelector:@selector(sxy_objectAtIndexedSubscript:) error:nil];
    });
}

- (id)sxy_objectAtIndexedSubscript:(NSUInteger)idx{
    if (idx < self.count) {
        return [self sxy_objectAtIndexedSubscript:idx];
    }else{
        NSLog(@" 你的 NSArray数组已经越界了 但是已经帮你处理好了  %ld   %ld", idx, self.count);
        return nil;
    }
}

- (id)sxy_objectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        return [self sxy_objectAtIndex:index];
    }else{
        NSLog(@" 你的 NSArray数组已经越界了 但是已经帮你处理好了  %ld   %ld", index, self.count);
        
        return nil;
    }
}

@end