//
//  LxAccountManager.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LxUser.h"

@interface LxAccountManager : NSObject

@property (nonatomic,retain,readonly) LxUser * currentAccountUser;

- (void)login;
- (void)logout;

@end
