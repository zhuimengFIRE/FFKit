//
//  NSString+helper.m
//  FFKit
//
//  Created by 方超 on 2020/7/6.
//  Copyright © 2020 GTion. All rights reserved.
//

#import "NSString+helper.h"


@implementation NSString (helper)

- (NSString *)ff_stringFromTimestampWithFormat:(NSString *)format{
    NSTimeInterval interval    = [self doubleValue];
    NSDate *date   = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateString = [formatter stringFromDate: date];
    return dateString;
}

- (NSDate *)ff_dateWithStringFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

- (NSString *)ff_subStringWithDortCount:(NSInteger)count {
    NSRange range = [self rangeOfString:@"."];
    NSString *result;
    if (self.length > range.location+count+1) {
        result = [self substringWithRange:NSMakeRange(0, range.location+count+1)];
    }else {
        result = self;
    }
    return result;
}

- (NSString *)ff_addZeroEndWithRound:(NSInteger)round {
    // 没有小数
    NSString *result = self;
    if ([self rangeOfString:@"."].location == NSNotFound) {
        if (round>0) {
            NSMutableString *zero = [[NSMutableString alloc] init];
            for (NSInteger i = 0; i < round; i ++) {
                [zero appendString:@"0"];
            }
            result = [NSString stringWithFormat:@"%@.%@",result,zero];
        }
    }else {
        NSInteger index = [self rangeOfString:@"."].location+1;
        // 有几位小数
        NSInteger count = self.length-index;
        NSMutableString *zero = [[NSMutableString alloc] init];
        for (NSInteger i = 0; i < round-count; i ++) {
            [zero appendString:@"0"];
        }
        result = [NSString stringWithFormat:@"%@%@",result,zero];
    }
    return result;
}


- (NSString *)ff_numberRounding{
    float num = [self floatValue];
    float newNum = floorf(num*100+0.5)/100;
    return [NSString stringWithFormat:@"%.2f",newNum];
}

- (NSString *)ff_decimalAlwaysUpWithRound:(NSInteger)round {
   NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp
                                                                                             scale:round
                                                                                  raiseOnExactness:NO
                                                                                   raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                               raiseOnDivideByZero:YES];
    NSDecimalNumber *dec1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *dec2 = [dec1 decimalNumberByRoundingAccordingToBehavior:handler];
    
    return [[dec2 stringValue] ff_addZeroEndWithRound:round];
}

- (NSString *)ff_removeFloatAllZero {
    NSString * s = nil;
    long offset = self.length - 1;
    while (offset)
    {
        s = [self substringWithRange:NSMakeRange(offset, 1)];
        
        if (([s isEqualToString:@"0"] || [s isEqualToString:@"."]) && [self containsString:@"."]) {
            offset--;
            if ([s isEqualToString:@"."]) {
                break;
            }
        }else {
            break;
        }
    }
    return  [self substringToIndex:offset+1];
}

- (NSString *)ff_hiddenPhoneNum {
    NSInteger length = self.length;
    if (length == 6) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(2, 2) withString:@"**"];
    }else if (length == 7) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(2, 3) withString:@"***"];
    }else if (length == 8) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(3, 2) withString:@"**"];
    }else if (length == 9) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(3, 3) withString:@"***"];
    }else if (length == 10) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }else if (length == 11) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    }
    return self;
}

- (NSString *)ff_hiddenEmail{
    if (self.length == 0) {
        return @"";
    }
    NSInteger last = [self rangeOfString:@"@"].location;
    if (last<4) {
        return self;
    }
    NSString *result = [self stringByReplacingCharactersInRange:NSMakeRange(3, last-3) withString:@"****"];
    return result;
}


- (NSString *)ff_numberAddWith:(NSString *)num round:(NSInteger)round{
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                             scale:round
                                                                                  raiseOnExactness:NO
                                                                                   raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                               raiseOnDivideByZero:YES];
    NSDecimalNumber *dec1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *dec2 = [NSDecimalNumber decimalNumberWithString:num];
    NSDecimalNumber *multiplyResult = [dec1 decimalNumberByAdding:dec2
                                                          withBehavior:handler];
    return [multiplyResult stringValue];
}

- (NSString *)ff_numberSubtractingWith:(NSString *)num round:(NSInteger)round{
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                             scale:round
                                                                                  raiseOnExactness:NO
                                                                                   raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                               raiseOnDivideByZero:YES];
    NSDecimalNumber *dec1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *dec2 = [NSDecimalNumber decimalNumberWithString:num];
    NSDecimalNumber *multiplyResult = [dec1 decimalNumberBySubtracting:dec2
                                                          withBehavior:handler];
    return [multiplyResult stringValue];
}

- (NSString *)ff_numberMultiplyingWith:(NSString *)num round:(NSInteger)round{
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                             scale:round
                                                                                  raiseOnExactness:NO
                                                                                   raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                               raiseOnDivideByZero:YES];
    NSDecimalNumber *dec1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *dec2 = [NSDecimalNumber decimalNumberWithString:num];
    NSDecimalNumber *multiplyResult = [dec1 decimalNumberByMultiplyingBy:dec2
                                                          withBehavior:handler];
    return [multiplyResult stringValue];
}

- (NSString *)ff_numberDivisionWith:(NSString *)num round:(NSInteger)round{
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                             scale:round
                                                                                  raiseOnExactness:NO
                                                                                   raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                               raiseOnDivideByZero:YES];
    NSDecimalNumber *dec1 = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *dec2 = [NSDecimalNumber decimalNumberWithString:num];
    NSDecimalNumber *multiplyResult = [dec1 decimalNumberByDividingBy:dec2
                                                         withBehavior:handler];
    return [multiplyResult stringValue];
}

- (NSString *)ff_addDotToMoney{
    NSString *intStr;
    NSString *floStr;
    if ([self containsString:@"."]) {
        NSRange range = [self rangeOfString:@"."];
         floStr = [self substringFromIndex:range.location];
         intStr = [self substringToIndex:range.location];
    }else{
        floStr = @"";
        intStr = self;
    }
    if (intStr.length <=3) {
        return [intStr stringByAppendingString:floStr];
    }else{
        NSInteger length = intStr.length;
        NSInteger count = length/3;
        NSInteger y = length%3;
 
        NSString *tit = [intStr substringToIndex:y] ;
        NSMutableString *det = [[intStr substringFromIndex:y] mutableCopy];
 
        for (int i =0; i < count; i ++) {
            NSInteger index = i + i *3;
            [det insertString:@","atIndex:index];
        }
        if (y ==0) {
            det = [[det substringFromIndex:1]mutableCopy];
        }
        intStr = [tit stringByAppendingString:det];
        return [intStr stringByAppendingString:floStr];
    }
}

- (BOOL)ff_judgeCoinAddressWithCoin:(NSString *)coin {
    NSString *eth = @"^0x[0-9a-fA-F]{40}$";
    NSString *btc = @"^[13][a-km-zA-HJ-NP-Z1-9]{26,33}$";
    NSString *ltc = @"^[LM3][a-km-zA-HJ-NP-Z1-9]{26,33}$";
    NSString *bch = @"^(bitcoincash:)?(q|p)[a-z0-9]{41}$";
    NSString *bsv = @"^[13][a-km-zA-HJ-NP-Z1-9]{33}$";
    NSString *xmr = @"^4[0-9AB][1-9A-HJ-NP-Za-km-z]{93}$";
    NSString *xmr2 = @"^4[0-9A-Z][1-9A-HJ-NP-Za-km-z]{104}$";
    NSString *xmr3 = @"^8[0-9A-Z][1-9A-HJ-NP-Za-km-z]{93}$";
    NSString *dic = @"^R[0-9a-zA-Z]{33}$";
    NSPredicate *predicateETH = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",eth];
    NSPredicate *predicateBTC = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",btc];
    NSPredicate *predicateLTC = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",ltc];
    NSPredicate *predicateBCH = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bch];
    NSPredicate *predicateBSV = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bsv];
    NSPredicate *predicateXMR = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",xmr];
    NSPredicate *predicateXMR2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",xmr2];
    NSPredicate *predicateXMR3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",xmr3];
    NSPredicate *predicateDIC = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",dic];
    BOOL result = YES;
    if ([coin isEqualToString:@"eth"]) {
        result = [predicateETH evaluateWithObject:self];
    }else if ([coin isEqualToString:@"btc"]) {
        result = [predicateBTC evaluateWithObject:self];
    }else if ([coin isEqualToString:@"ltc"]) {
        result = [predicateLTC evaluateWithObject:self];
    }else if ([coin isEqualToString:@"bch"] || [coin isEqualToString:@"bsv"]) {
        result = [predicateBCH evaluateWithObject:self] || [predicateBSV evaluateWithObject:self];
    }else if ([coin isEqualToString:@"xmr"]) {
        result = [predicateXMR evaluateWithObject:self] || [predicateXMR2 evaluateWithObject:self] || [predicateXMR3 evaluateWithObject:self];
    }else if ([coin isEqualToString:@"dic"]) {
        result = [predicateDIC evaluateWithObject:self];
    }
    
    return result;
}

- (BOOL)ff_compareWithVersion:(NSString *)version lastVersion:(NSString *)lastVersion {
//    NSString *currentVersion = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    NSInteger length = (version.length>lastVersion.length)?version.length:lastVersion.length;
    if (version.length < length) {
        while (version.length < length) {
            version = [version stringByAppendingString:@"0"];
        }
    }
    if (lastVersion.length < length) {
        while (lastVersion.length < length) {
            lastVersion = [lastVersion stringByAppendingString:@"0"];
        }
        
    }
    
    NSInteger current = [[version stringByReplacingOccurrencesOfString:@"." withString:@""] integerValue];
    NSInteger force = [[lastVersion stringByReplacingOccurrencesOfString:@"." withString:@""] integerValue];
    if (current > force) {
        return YES;
    }else {
        return NO;
    }
}

@end
