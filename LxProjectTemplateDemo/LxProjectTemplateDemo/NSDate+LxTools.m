//
//  NSDate+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "NSDate+LxTools.h"

@implementation NSDate (LxTools)

+ (NSDateFormatter *)sharedDateFormatter
{
    static NSDateFormatter * sharedDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDateFormatter = [[NSDateFormatter alloc]init];
    });
    return sharedDateFormatter;
}

@end
