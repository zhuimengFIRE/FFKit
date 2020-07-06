//
//  NSString+helper.h
//  FFKit
//
//  Created by 方超 on 2020/7/6.
//  Copyright © 2020 GTion. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (helper)

/**
 * 时间戳转字符串
 *
 * @param format @"yyyy-MM-dd HH:mm:ss"
 * @return 时间字符串
 *
 */
- (NSString *)ff_stringFromTimestampWithFormat:(NSString *)format;

/**
 * 字符串转NSDate
 *
 * @param format @"yyyy-MM-dd HH:mm:ss"
 * @return NSDate
 *
 */
- (NSDate *)ff_dateWithStringFormat:(NSString *)format;

/**
 * 保留小数点后几位
 *
 * @param count 保留小数位数
 * @return 截取后的字符串
 *
 */
- (NSString *)ff_subStringWithDortCount:(NSInteger)count;

/**
 *
 * 根据小数位数 在末尾补零
 */
- (NSString *)ff_addZeroEndWithRound:(NSInteger)round;

/**
 *
 * 四舍五入 保留两位小数
 */
- (NSString *)ff_numberRounding;

/**
 *
 * 保留小数位数 向上取整（进位）
 */
- (NSString *)ff_decimalAlwaysUpWithRound:(NSInteger)round;


/**
 *
 * 去除浮点数字符串后面的0
 */
- (NSString *)ff_removeFloatAllZero;

/**
 *
 * 手机号中间数用*替代
 */
- (NSString *)ff_hiddenPhoneNum;

/**
 *
 * 邮箱隐藏 从第4位开始
 */
- (NSString *)ff_hiddenEmail;


/**
 *
 * 两个数相加
 *
 * @param round 保留小数位数
 *
 */
- (NSString *)ff_numberAddWith:(NSString *)num round:(NSInteger)round;

/**
 *
 * 两个数相减
 *
 * @param round 保留小数位数
 *
 */
- (NSString *)ff_numberSubtractingWith:(NSString *)num round:(NSInteger)round;

/**
 *
 * 两个数相乘
 *
 * @param round 保留小数位数
 *
 */
- (NSString *)ff_numberMultiplyingWith:(NSString *)num round:(NSInteger)round;

/**
 * 两个数相除
 *
 * @param round 保留小数位数
 *
 */
- (NSString *)ff_numberDivisionWith:(NSString *)num round:(NSInteger)round;

/**
 *
 * 数字每3位添加分号
 */
- (NSString *)ff_addDotToMoney;

/**
 * 正则判断
 *
 * 1. 主链为eth 以及 eth  ^0x[0-9a-fA-F]{40}$
 * 2. 主链为btc 以及 btc   ^[13][a-km-zA-HJ-NP-Z1-9]{26,33}$
 * 3. ltc校验  ^[LM3][a-km-zA-HJ-NP-Z1-9]{26,33}$
 * 4. bch和 bsv 校验  ^(bitcoincash:)?(q|p)[a-z0-9]{41}$ 或者 ^[13][a-km-zA-HJ-NP-Z1-9]{33}$
 * 5. xmr 校验 ^4[0-9AB][1-9A-HJ-NP-Za-km-z]{93}$
 * 6. dic 校验 ^R[0-9a-zA-Z]{33}$
 *
 * return YES 验证通过
 */
- (BOOL)ff_judgeCoinAddressWithCoin:(NSString *)coin;


/**
 * 两个版本比较
 *
 * @param version 版本1
 * @param lastVersion 版本2
 * @return YES(version大于lastVersion)  NO（version小于lastVersion）
 *
 */
- (BOOL)ff_compareWithVersion:(NSString *)version lastVersion:(NSString *)lastVersion;

@end

NS_ASSUME_NONNULL_END
