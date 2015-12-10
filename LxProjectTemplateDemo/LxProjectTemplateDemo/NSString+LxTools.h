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
+ (NSString *)stringWithUTF8Data:(NSData *)utf8Data;

@property (nonatomic,readonly) NSString * reverseString;

@property (nonatomic,readonly) BOOL visible;
@property (nonatomic,readonly) NSString * visibleSubstring;

- (BOOL)hasSubString:(NSString *)aString;

- (NSString *)stringWithReplaceDictionary:(NSDictionary *)replaceDictionary;

+ (NSInteger)startDifferentCharacterIndexBetweenString1:(NSString *)string1 string2:(NSString *)string2;

#pragma mark - judge

@property (nonatomic,readonly) BOOL isValidEmail;
@property (nonatomic,readonly) BOOL isValidIPAddress;
@property (nonatomic,readonly) BOOL isValidUrlString;
@property (nonatomic,readonly) BOOL isValidFilePath;

@property (nonatomic,readonly) BOOL containChineseCharacter;
@property (nonatomic,readonly) BOOL onlyContainChineseCharacter;

- (BOOL)matchesRegularExpression:(NSString *)regularExpression;

#pragma mark - cipher

@property (nonatomic,readonly) NSString * md5String;
@property (nonatomic,readonly) NSString * MD5String;

@property (nonatomic,readonly) NSData * base64EncodedData;
@property (nonatomic,readonly) NSString * base64EncodedString;
@property (nonatomic,readonly) NSData * base64DecodedData;
@property (nonatomic,readonly) NSString * base64DecodedString;

- (NSString *)desEncryptWithKey:(NSString *)key;
- (NSString *)desDecryptWithKey:(NSString *)key;

@end
