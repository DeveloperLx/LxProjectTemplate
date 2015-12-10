//
//  NSDictionary+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (LxTools)

- (BOOL)isPartOfDictionary:(NSDictionary *)otherDictionary;
- (NSDictionary *)subDictionaryForKeys:(NSArray *)keys;

#pragma mark - common dictionary

@property (nonatomic,readonly) NSString * urlQueryString;

@end
