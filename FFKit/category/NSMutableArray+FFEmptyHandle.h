//
//  NSMutableArray+FFEmptyHandle.h
//  UKEX
//
//  Created by 方超 on 2019/12/23.
//  Copyright © 2019 ffang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (FFEmptyHandle)
/**
 数组中插入数据

 @param object 数据
 @param index 下标
 */
- (void)insertObjectVerify:(id)object atIndex:(NSInteger)index;
/**
 数组中添加数据

 @param object 数据
 */
- (void)addObjectVerify:(id)object;
@end

NS_ASSUME_NONNULL_END
