//
//  NSString+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "NSString+LxTools.h"
#import <CommonCrypto/CommonDigest.h>

#define Base64EncodingOptions   (NSDataBase64Encoding64CharacterLineLength)
#define Base64DecodingOptions   (NSDataBase64DecodingIgnoreUnknownCharacters)

@implementation NSString (LxTools)

- (NSRange)entireRange
{
    return NSMakeRange(0, self.length);
}

- (NSData *)UTF8Data
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)stringWithUTF8Data:(NSData *)utf8Data
{
    if (utf8Data.length > 0) {
        return [[NSString alloc]initWithData:utf8Data encoding:NSUTF8StringEncoding];
    }
    else {
        return nil;
    }
}

- (NSString *)reverseString
{
    NSMutableString * reverseString = [NSMutableString string];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length)
                             options:NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                             
                              [reverseString appendString:substring];
                          }];

    return [NSString stringWithString:reverseString];
}

- (BOOL)visible
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length > 0;
}

- (NSString *)visibleSubstring
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)hasSubString:(NSString *)aString
{
    if (aString.length == 0) {
        return NO;
    }
    else {
        NSRange range = [self rangeOfString:aString];
        return range.location != NSNotFound;
    }
}

- (NSString *)stringWithReplaceDictionary:(NSDictionary *)replaceDictionary
{
    NSString * resultString = self;
    for (NSString * key in replaceDictionary.allKeys) {
        resultString = [resultString stringByReplacingOccurrencesOfString:key withString:replaceDictionary[key]];
    }
    return resultString;
}

+ (NSInteger)startDifferentCharacterIndexBetweenString1:(NSString *)string1 string2:(NSString *)string2
{
    NSInteger startIndex = 0;
    for (int i = 0; i < MIN(string1.length, string2.length); i++) {
        
        if ([string1 characterAtIndex:i] == [string2 characterAtIndex:i]) {
            startIndex = i;
        }
        else {
            break;
        }
    }
    startIndex++;
    
    return startIndex;
}

#pragma mark - judge

- (BOOL)isValidEmail
{
    NSString * pattern =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    NSError * error = nil;
    NSRegularExpression * regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult * textCheckingResult = [regularExpression firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    return textCheckingResult != nil;
}

- (BOOL)isValidIPAddress
{
    NSString * pattern = @"UNFINISHED";
    NSError * error = nil;
    NSRegularExpression * regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult * textCheckingResult = [regularExpression firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    return textCheckingResult != nil;
}

- (BOOL)isValidUrlString
{
    NSString * pattern = @"UNFINISHED";
    NSError * error = nil;
    NSRegularExpression * regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult * textCheckingResult = [regularExpression firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    return textCheckingResult != nil;
}

- (BOOL)isValidFilePath
{
    NSString * pattern = @"UNFINISHED";
    NSError * error = nil;
    NSRegularExpression * regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult * textCheckingResult = [regularExpression firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    return textCheckingResult != nil;
}

- (BOOL)containChineseCharacter
{
    for(int i = 0; i < [self length]; i++) {
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
            return YES;
    }
    return NO;
}

- (BOOL)onlyContainChineseCharacter
{
    BOOL onlyHasChineseCharacter = YES;
    
    for(int i = 0; i < [self length]; i++) {
        int a = [self characterAtIndex:i];
        if(!(a > 0x4e00 && a < 0x9fff))
            return NO;
    }
    return onlyHasChineseCharacter;
}

- (BOOL)matchesRegularExpression:(NSString *)regex
{
    NSError * error = nil;
    NSRegularExpression * regularExpression = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult * textCheckingResult = [regularExpression firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    return textCheckingResult != nil;
}

#pragma mark - cipher

- (NSString *)md5String
{
    const char * original_str = self.UTF8String;
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString * hash = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    return [NSString stringWithString:hash].lowercaseString;
}

- (NSString *)MD5String
{
    const char *original_str = self.UTF8String;
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [NSString stringWithString:hash].uppercaseString;
}

- (NSData *)base64Data
{
    return [self.UTF8Data base64EncodedDataWithOptions:Base64EncodingOptions];
}

- (NSData *)debase64Data
{
    return [[NSData alloc]initWithBase64EncodedString:self options:Base64DecodingOptions];
}

- (NSString *)base64String
{
    return [self.UTF8Data base64EncodedStringWithOptions:Base64EncodingOptions];
}

- (NSString *)debase64String
{
    NSData * debase64Data = self.debase64Data;
    if (debase64Data.length > 0) {
        return [NSString stringWithUTF8Data:self.debase64Data];
    }
    else {
        return nil;
    }
}

@end
