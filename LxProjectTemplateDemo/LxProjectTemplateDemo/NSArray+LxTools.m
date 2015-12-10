//
//  NSArray+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "NSArray+LxTools.h"

@implementation NSArray (LxTools)

#pragma mark - common array

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
