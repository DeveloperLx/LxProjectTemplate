//
//  NSArray+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LxTools)

@property (nonatomic,readonly) NSRange entireRange;
- (BOOL)validForIndex:(NSInteger)index;

@property (nonatomic,readonly) BOOL isPure;
- (NSArray *)purifiedArray;

- (NSArray *)reverseArray;

- (id)randomObject;
- (NSArray *)disorderArray;

- (void)makeObjectsPerformBlcok:(void (^)(id object))block;

- (BOOL)allElementsConforms:(BOOL (^)(id element))condition;
- (NSInteger)firstElementIndexConforms:(BOOL (^)(id element))condition;
- (NSArray *)subArrayWhoseElementsConforms:(BOOL (^)(id element))condition;

#pragma mark - common array

+ (NSArray *)lowerLetterArray;
+ (NSArray *)upperLetterArray;
+ (NSArray *)lowerRomanNumeralArray;
+ (NSArray *)upperRomanNumeralArray;
+ (NSArray *)chineseNumberStringArray;
+ (NSArray *)upperChineseNumberStringArray;

+ (NSArray *)numberEnglishNameArray;
+ (NSArray *)indexEnglishNameArray;
+ (NSArray *)weekDayEnglishNameArray;
+ (NSArray *)monthEnglishNameArray;
+ (NSArray *)seasonEnglishNameArray;

+ (NSArray *)weekDayChineseNameArray;
+ (NSArray *)weekDayChineseNameArray2;
+ (NSArray *)weekDayChineseNameArray3;
+ (NSArray *)seasonChineseNameArray;

@end
