//
//  LxDataBaseManager.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

DECLARE_STRING_CONST(kDataBaseVersion);

static CGFloat const CURRENT_DATABASE_VERSION = 1.0f;

@interface LxDataBaseManager : NSObject

+ (void)createTablesAndIndexesIfNotExists;
+ (void)checkAndUpdateDataBaseVersion;

@end
