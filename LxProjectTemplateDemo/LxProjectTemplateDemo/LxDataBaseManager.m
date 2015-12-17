//
//  LxDataBaseManager.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "LxDataBaseManager.h"
#import "FMDB.h"

static NSString * const USER_TABLE_NAME = @"user";
static NSString * const USER_TABLE_INDEX_NAME = @"user_index";

@implementation LxDataBaseManager

+ (FMDatabase *)sharedDataBase
{
    static FMDatabase * sharedDataBase = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSString * datebaseFilePath = [LxDataBaseManager datebaseFilePath];
        sharedDataBase = [FMDatabase databaseWithPath:datebaseFilePath];
    });
    return sharedDataBase;
}

+ (NSString *)datebaseFilePath
{
    NSString * datebaseFileName = @"app.sqlite";
    
    NSString * datebaseFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    datebaseFilePath = [datebaseFilePath stringByAppendingPathComponent:datebaseFileName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:datebaseFilePath] == NO) {
        
        BOOL createFileSuccess = [[NSFileManager defaultManager] createFileAtPath:datebaseFilePath contents:nil attributes:nil];
        
        NSCAssert(createFileSuccess, @"LxDataBaseManager：创建数据库文件失败");
    }
    
    return datebaseFilePath;
}

+ (NSString *)sqlStringByClearNullSubstring:(NSString *)sqlString
{
    return [sqlString stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
}

+ (void)createTablesAndIndexesIfNotExists
{
    FMDatabase * sharedDataBase = [LxDataBaseManager sharedDataBase];
    
    if ([sharedDataBase open]) {
        if ([sharedDataBase beginTransaction]) {
            
            NSString * sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(user_id TEXT NOT NULL, user_avatar TEXT, user_name TEXT, password TEXT, is_friend INTEGER)", USER_TABLE_NAME];
            if ([sharedDataBase executeUpdate:sql] == NO) {
                
                NSLog(@"LxDataBaseManager：执行sql语句失败: %@", sql);    //
            }
            
            sql = [NSString stringWithFormat:@"CREATE UNIQUE INDEX IF NOT EXISTS %@ ON %@(user_id)", USER_TABLE_INDEX_NAME, USER_TABLE_NAME];
            if ([sharedDataBase executeUpdate:sql] == NO) {
                
                NSLog(@"LxDataBaseManager：执行sql语句失败: %@", sql);    //
            }
            
            if ([sharedDataBase commit] == NO) {
                NSLog(@"LxDataBaseManager：执行事务失败");  //
            }
        }
        else {
            NSLog(@"LxDataBaseManager：开始事务失败");  //
        }
        
        if ([sharedDataBase close] == NO) {
            NSLog(@"LxDataBaseManager：关闭数据库失败");  //
        }
    }
    else {
        NSLog(@"LxDataBaseManager：打开数据库失败");  //
    }
}

@end
