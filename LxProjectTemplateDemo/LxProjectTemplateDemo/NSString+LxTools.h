//
//  NSString+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LxTools)

@property (nonatomic,readonly) NSRange wholeRange;

@property (nonatomic,readonly) NSData * UTF8Data;
+ (NSString *)stringWithUTF8Data:(NSData *)data;

@property (nonatomic,readonly) NSString * reverseString;

@property (nonatomic,readonly) BOOL visible;
@property (nonatomic,readonly) NSString * visibleSubstring;

- (BOOL)hasSubString:(NSString *)aString;

- (NSString *)stringWithReplaceDictionary:(NSDictionary *)replaceDictionary;

#pragma mark - judge

@property (nonatomic,readonly) BOOL isValidEmail;
@property (nonatomic,readonly) BOOL isValidIPAddress;
@property (nonatomic,readonly) BOOL isValidUrlString;
@property (nonatomic,readonly) BOOL isValidFilePath;

@property (nonatomic,readonly) BOOL containChineseCharacter;
@property (nonatomic,readonly) BOOL onlyContainChineseCharacter;

- (BOOL)matchesRegularExpression:(NSString *)regularExpression;

+ (NSInteger)startDifferentCharacterIndexBetweenString1:(NSString *)string1 string2:(NSString *)string2;

#pragma mark - cipher



@end
