//
//  LxAccountManager.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "LxAccountManager.h"
#import "LxNetwotkManager.h"

@interface LxAccountManager ()

@property (nonatomic,retain) LxUser * currentUser;

@end

@implementation LxAccountManager

+ (instancetype)sharedAccountManager
{
    static LxAccountManager * sharedAccountManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAccountManager = [[LxAccountManager alloc]init];
    });
    return sharedAccountManager;
}

- (void)login{}
- (void)logout{}

- (void)saveCurrentUserToDisk{}
- (void)clearPersistentUserInfoWithUserId:(NSString *)userId{}

@end
