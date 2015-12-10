//
//  NSData+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LxTools)

@property (nonatomic,readonly) NSString * UTF8String;

@property (nonatomic,readonly) NSString * bytesDescription;
+ (NSData *)dataWithBytesDescription:(NSString *)bytesDescription;

@end
