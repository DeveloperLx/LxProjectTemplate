//
//  LxSettingManager.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LxSettingManager : NSObject

@property (nonatomic,readonly) unsigned long long cacheSize;

- (BOOL)clearCache;

@end
