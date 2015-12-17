//
//  LxAccountManager.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LxUser.h"

DECLARE_STRING_CONST(kNeedAutoLogin);
DECLARE_STRING_CONST(kUserAvatar);
DECLARE_STRING_CONST(kUsername);
DECLARE_STRING_CONST(kPassword);
DECLARE_STRING_CONST(kUserId);

DECLARE_STRING_CONST(LoginSuccessNotification);
DECLARE_STRING_CONST(LogoutSuccessNotification);

DECLARE_STRING_CONST(UpdateUserAvatarSuccessNotification);
DECLARE_STRING_CONST(UpdateUsernameSuccessNotification);
DECLARE_STRING_CONST(UpdatePasswordSuccessNotification);

@interface LxAccountManager : NSObject

+ (instancetype)sharedAccountManager;

@property (nonatomic,retain,readonly) LxUser * currentUser;

- (void)login;
- (void)logout;

- (void)saveCurrentUserToDisk;
- (void)clearPersistentUserInfoWithUserId:(NSString *)userId;

@end
