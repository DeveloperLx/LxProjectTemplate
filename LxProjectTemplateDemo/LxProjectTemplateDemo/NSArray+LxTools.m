//
//  NSArray+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "NSArray+LxTools.h"

@implementation NSArray (LxTools)

- (NSRange)entireRange
{
    return NSMakeRange(0, self.count);
}

- (BOOL)validForIndex:(NSInteger)index
{
    return NSLocationInRange(index, self.entireRange);
}

- (BOOL)isPure
{
    for (int i = 0; i < self.count; i++) {
        for (int j = i + 1; j < self.count; j++) {
            if (self[i] == self[j] || [self[i] isEqual:self[j]]) {
                return NO;
            }
        }
    }
    return YES;
}

- (NSArray *)purifiedArray
{
    NSMutableArray * purifiedArray = [NSMutableArray arrayWithArray:self];
    for (int i = 0; i < purifiedArray.count; i ++) {
        for (int j = i + 1; j < purifiedArray.count; j++) {
            if (purifiedArray[i] == purifiedArray[j] || [purifiedArray[i] isEqual:purifiedArray[j]]) {
                [purifiedArray removeObjectAtIndex:j];
            }
        }
    }
    return [NSArray arrayWithArray:purifiedArray];
}

- (NSArray *)reverseArray
{
    NSMutableArray * reverseArray = [NSMutableArray array];
    for (id element in self.reverseObjectEnumerator) {
        [reverseArray addObject:element];
    }
    return [NSArray arrayWithArray:reverseArray];
}

- (id)randomObject
{
    if (self.count > 0) {
        return self[arc4random()%self.count];
    }
    else {
        return nil;
    }
}

- (NSArray *)disorderArray
{
    NSMutableArray * disorderArray = [NSMutableArray arrayWithArray:self];
    
    [disorderArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
     
        return (NSComparisonResult)(arc4random()%3 - 1);
    }];
    
    return [NSArray arrayWithArray:disorderArray];
}

- (void)makeObjectsPerformBlcok:(void (^)(id object))block
{
    NSParameterAssert(block);
    
    for (id object in self) {
        block(object);
    }
}

- (BOOL)allElementsConforms:(BOOL (^)(id element))condition
{
    NSParameterAssert(condition);
    
    for (id element in self) {
        
        if (condition(element) == NO) {
            return NO;
        }
    }
    
    return YES;
}

- (NSInteger)firstElementIndexConforms:(BOOL (^)(id element))condition
{
    for (NSInteger i = 0; i < self.count; i++) {
        id element = self[i];
        if (condition == NULL || condition(element)) {
            return i;
        }
    }
    
    return NSNotFound;
}

- (NSArray *)subArrayWhoseElementsConforms:(BOOL (^)(id element))condition
{
    NSParameterAssert(condition);

    NSMutableArray * subArray = [NSMutableArray array];
    
    for (id element in self) {
        if (condition == NULL || condition(element)) {
            [subArray addObject:element];
        }
    }
    
    return [NSArray arrayWithArray:subArray];
}

#pragma mark - common array

+ (NSArray *)lowerLetterArray
{
    static NSArray * lowerLetterArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lowerLetterArray = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"];
    });
    
    return lowerLetterArray;
}

+ (NSArray *)upperLetterArray
{
    static NSArray * upperLetterArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        upperLetterArray = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    });
    
    return upperLetterArray;
}

+ (NSArray *)lowerRomanNumeralArray
{
    static NSArray * lowerRomanNumeralArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lowerRomanNumeralArray = @[@"i",@"ii",@"iii",@"iv",@"v",@"vi",@"vii",@"viii",@"ix",@"x",@"xi",@"xii"];
    });
    
    return lowerRomanNumeralArray;
}

+ (NSArray *)upperRomanNumeralArray
{
    static NSArray * upperRomanNumeralArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        upperRomanNumeralArray = @[@"I",@"II",@"III",@"IV",@"V",@"VI",@"VII",@"VIII",@"IX",@"X",@"XI",@"XII"];
    });
    
    return upperRomanNumeralArray;
}

+ (NSArray *)chineseNumberStringArray
{
    static NSArray * chineseNumberStringArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        chineseNumberStringArray = @[@"零",@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十"];
    });
    
    return chineseNumberStringArray;
}

+ (NSArray *)upperChineseNumberStringArray
{
    static NSArray * upperChineseNumberStringArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        upperChineseNumberStringArray = @[@"零",@"壹",@"贰",@"叁",@"肆",@"伍",@"陆",@"柒",@"捌",@"玖",@"拾"];
    });
    
    return upperChineseNumberStringArray;
}

+ (NSArray *)numberEnglishNameArray
{
    static NSArray * numberEnglishNameArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberEnglishNameArray = @[@"zero",@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"nine",@"ten",@"eleven",@"twelve",@"thirteen",@"fourteen",@"fifteen",@"sixteen",@"seventeen",@"eighteen",@"nineteen",@"twenty"];
    });
    
    return numberEnglishNameArray;
}

+ (NSArray *)indexEnglishNameArray
{
    static NSArray * indexEnglishNameArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        indexEnglishNameArray = @[@"zeroth",@"first",@"second",@"third",@"fifth",@"sixth",@"seventh",@"eighth",@"ninth",@"tenth",@"eleventh",@"twelfth",@"thirteenth",@"fourteenth",@"fifteenth",@"sixteenth",@"seventeenth",@"eighteenth",@"nineteenth",@"twentieth"];
    });
    
    return indexEnglishNameArray;
}

+ (NSArray *)weekDayEnglishNameArray
{
    static NSArray * weekDayEnglishNameArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weekDayEnglishNameArray = @[@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday"];
    });
    
    return weekDayEnglishNameArray;
}

+ (NSArray *)monthEnglishNameArray
{
    static NSArray * monthEnglishNameArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        monthEnglishNameArray = @[@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December"];
    });
    
    return monthEnglishNameArray;
}

+ (NSArray *)seasonEnglishNameArray
{
    static NSArray * seasonEnglishNameArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        seasonEnglishNameArray = @[@"Spring",@"Summer",@"Fall",@"Winter"];
    });
    
    return seasonEnglishNameArray;
}

+ (NSArray *)weekDayChineseNameArray
{
    static NSArray * weekDayChineseNameArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weekDayChineseNameArray = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    });
    
    return weekDayChineseNameArray;
}

+ (NSArray *)weekDayChineseNameArray2
{
    static NSArray * weekDayChineseNameArray2 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weekDayChineseNameArray2 = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    });
    
    return weekDayChineseNameArray2;
}

+ (NSArray *)weekDayChineseNameArray3
{
    static NSArray * weekDayChineseNameArray3 = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        weekDayChineseNameArray3 = @[@"礼拜日",@"礼拜一",@"礼拜二",@"礼拜三",@"礼拜四",@"礼拜五",@"礼拜六",@"礼拜日"];
    });
    
    return weekDayChineseNameArray3;
}

+ (NSArray *)seasonChineseNameArray
{
    static NSArray * seasonChineseNameArray = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        seasonChineseNameArray = @[@"春",@"夏",@"秋",@"冬"];
    });
    
    return seasonChineseNameArray;
}

@end
