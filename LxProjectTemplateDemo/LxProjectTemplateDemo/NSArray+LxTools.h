//
//  NSArray+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LxTools)

@property (nonatomic,readonly) NSRange wholeRange;
- (BOOL)validForIndex:(NSInteger)index;

@property (nonatomic,readonly) BOOL isPure;

- (NSArray *)reverseArray;
- (NSArray *)purifiedArray;

- (id)randomObject;
- (NSArray *)disorderArray;

- (void)elementsExecute:(void (^)(id element))action;
- (NSArray *)elementsMap:(id (^)(id element))map;

- (BOOL)allElementsConforms:(BOOL (^)(id element))condition;
- (NSInteger)firstElementIndexConforms:(BOOL (^)(id element))condition;
- (BOOL)subArrayWhoseElementsConforms:(BOOL (^)(id element))condition;

#pragma mark - common array

+ (NSArray *)lowerLetterArray;
+ (NSArray *)upperLetterArray;
+ (NSArray *)lowerRomanNumeralArray;
+ (NSArray *)upperRomanNumeralArray;
+ (NSArray *)chineseNumberStringArray;
+ (NSArray *)upperChineseNumberStringArray;

+ (NSArray *)weekDayEnglishNameArray;
+ (NSArray *)monthEnglishNameArray;
+ (NSArray *)seasonEnglishNameArray;

+ (NSArray *)weekDayChineseNameArray;
+ (NSArray *)weekDayChineseNameArray2;
+ (NSArray *)weekDayChineseNameArray3;
+ (NSArray *)seasonChineseNameArray;

@end
