//
//  LxPushManager.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "LxPushManager.h"

@implementation LxPushManager

+ (BOOL)isPushOn
{
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
    
        return [UIApplication sharedApplication].isRegisteredForRemoteNotifications;
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
        return [UIApplication sharedApplication].enabledRemoteNotificationTypes != UIRemoteNotificationTypeNone;
#pragma clang diagnostic pop
    }
}

+ (UILocalNotification *)sharedLocalNotification
{
    static UILocalNotification * sharedLocalNotification = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLocalNotification = [[UILocalNotification alloc]init];
    });
    return sharedLocalNotification;
}

+ (void)setupWithLaunchOptions:(NSDictionary *)launchOptions
{

}

@end
