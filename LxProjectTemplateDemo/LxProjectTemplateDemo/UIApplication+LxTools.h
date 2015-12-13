//
//  UIApplication+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/13.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (LxTools)

@property (nonatomic,readonly) BOOL isBuildInSimulator;
@property (nonatomic,readonly) BOOL isInstalledFromAppStore;
@property (nonatomic,readonly) BOOL isBeingDebugged;
@property (nonatomic,readonly) int64_t memoryUsage;
@property (nonatomic,readonly) float cpuUsage;

@end
