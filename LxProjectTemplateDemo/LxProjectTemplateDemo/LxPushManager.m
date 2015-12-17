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

+ (void)registerRemotePush
{
    if ([[UIApplication sharedApplication]respondsToSelector:@selector(registerForRemoteNotifications)]) {
        [[UIApplication sharedApplication]registerForRemoteNotifications];
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
        [[UIApplication sharedApplication]registerForRemoteNotificationTypes:
         UIRemoteNotificationTypeBadge
         |UIRemoteNotificationTypeSound
         |UIRemoteNotificationTypeAlert
         |UIRemoteNotificationTypeNewsstandContentAvailability];
#pragma clang diagnostic pop
    }
    
    /**
         UIMutableUserNotificationAction * foregroundAction = [[UIMutableUserNotificationAction alloc]init];
         foregroundAction.identifier = @"foregroundAction";
         foregroundAction.title = @"接受";
         foregroundAction.activationMode = UIUserNotificationActivationModeForeground;
         
         UIMutableUserNotificationAction * backgroundAction = [[UIMutableUserNotificationAction alloc]init];
         backgroundAction.identifier = @"backgroundAction";
         backgroundAction.title = @"接受";
         backgroundAction.activationMode = UIUserNotificationActivationModeBackground;
         backgroundAction.authenticationRequired = YES;  //  需解锁后才能处理，若activationMode = UIUserNotificationActivationModeForeground 该属性将被忽略
         backgroundAction.destructive = YES;
         
         UIMutableUserNotificationCategory * category = [[UIMutableUserNotificationCategory alloc] init];
         category.identifier = @"category";
         [category setActions:@[foregroundAction, backgroundAction] forContext:UIUserNotificationActionContextDefault];
         UIUserNotificationSettings * settings = [UIUserNotificationSettings
         settingsForTypes:
         UIUserNotificationTypeBadge|
         UIUserNotificationTypeSound|
         UIUserNotificationTypeAlert
         categories:[NSSet setWithObject:category]];
     */
}

+ (void)unregisterRemotePush
{
    [[UIApplication sharedApplication]unregisterForRemoteNotifications];
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
