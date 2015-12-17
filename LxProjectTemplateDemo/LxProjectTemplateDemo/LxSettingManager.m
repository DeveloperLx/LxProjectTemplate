//
//  LxSettingManager.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "LxSettingManager.h"

@implementation LxSettingManager

- (NSString *)cacheDirectoryPath
{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}

- (unsigned long long)cacheSize
{
    NSString * cacheDirectoryPath = [self cacheDirectoryPath];
    NSError * error = nil;
    NSDictionary * attributes = [[NSFileManager defaultManager]attributesOfItemAtPath:cacheDirectoryPath error:&error];
    
    return attributes.fileSize;
}

- (BOOL)clearCache
{
    NSString * cacheDirectoryPath = [self cacheDirectoryPath];
    
    NSError * error = nil;
    
    BOOL clearCacheSuccess = [[NSFileManager defaultManager]removeItemAtPath:cacheDirectoryPath error:&error];
    
    if (clearCacheSuccess == NO) {
        NSLog(@"LxSettingManager：清空缓存失败");
    }
    
    return clearCacheSuccess;
}

@end
