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
        if (![self[key] isEqual:otherDictionary[key]]) {
            return NO;
        }
    }
    
    return YES;
}

@end
