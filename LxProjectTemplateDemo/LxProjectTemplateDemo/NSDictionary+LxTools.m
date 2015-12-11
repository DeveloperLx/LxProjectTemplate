//
//  NSDictionary+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "NSDictionary+LxTools.h"

@implementation NSDictionary (LxTools)

- (BOOL)isPartOfDictionary:(NSDictionary *)otherDictionary
{
    if (self.count > otherDictionary.count) {
        return NO;
    }
    
    for (NSString * key in self.allKeys) {
        if ([self[key] isEqual:otherDictionary[key]] == NO) {
            return NO;
        }
    }
    
    return YES;
}

- (NSDictionary *)subDictionaryForKeys:(NSArray *)keys
{
    NSMutableDictionary * subDictionary = [NSMutableDictionary dictionary];
    
    for (id key in keys) {
        
        if ([self.allKeys containsObject:key]) {
            [subDictionary setValue:self[key] forKey:key];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:subDictionary];
}

- (NSString *)urlQueryString
{
    NSMutableArray * keyValueStringArray = [NSMutableArray array];
    for (NSString * key in self.allKeys) {
        [keyValueStringArray addObject:[NSString stringWithFormat:@"%@=%@", key, self[key]]];
    }
    NSString * urlQueryString = [keyValueStringArray componentsJoinedByString:@"&"];
    urlQueryString = [urlQueryString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    return urlQueryString;
}

#pragma mark - common dictionary

+ (NSDictionary *)objectiveCTypeEncodingDictionary
{
    static NSDictionary * objectiveCTypeEncodingDictionary = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        objectiveCTypeEncodingDictionary = @{@"B":@"BOOL",
                                             @"c":@"char",
                                             @"C":@"unsigned char",
                                             @"s":@"short",
                                             @"S":@"unsigned short",
                                             @"i":@"int",
                                             @"I":@"unsigned int",
                                             @"l":@"long",
                                             @"L":@"unsigned long",
                                             @"q":@"long long",
                                             @"Q":@"unsigned long long",
                                             @"f":@"float",
                                             @"d":@"double",
                                             @"v":@"void",
                                             @"@":@"id",
                                             @"#":@"Class",
                                             @":":@"SEL",
                                             @"*":@"char *",
                                             @"?":@"unknown type",
                                             @"b":@"bit-fields",
                                             @"^":@"pointers",
                                             @"[]":@"arrays",
                                             @"{?}":@"structures",
                                             @"{CGPoint=dd}":@"CGPoint",
                                             @"{CGSize=dd}":@"CGSize",
                                             @"{CGRect={CGPoint=dd}{CGSize=dd}}":@"CGRect",
                                             @"{CGVector=dd}":@"CGVector",
                                             @"{CGAffineTransform=dddddd}":@"CGAffineTransform",
                                             @"{CATransform3D=dddddddddddddddd}":@"CATransform3D",
                                             @"{UIOffset=dd}":@"UIOffset",
                                             @"{UIEdgeInsets=dddd}":@"UIEdgeInsets",
                                             @"{_NSRange=QQ}":@"NSRange",
                                             @"(?)":@"unions",
                                             @"r":@"const",
                                             @"n":@"in",
                                             @"N":@"inout",
                                             @"o":@"out",
                                             @"O":@"bycopy",
                                             @"V":@"oneway"};
    });
    return objectiveCTypeEncodingDictionary;
}

@end
