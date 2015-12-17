//
//  LxPushManager.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

DECLARE_STRING_CONST(kDeviceToken);

@interface LxPushManager : NSObject

+ (BOOL)isPushOn;

+ (UILocalNotification *)sharedLocalNotification;

+ (void)setupWithLaunchOptions:(NSDictionary *)launchOptions;

@end
