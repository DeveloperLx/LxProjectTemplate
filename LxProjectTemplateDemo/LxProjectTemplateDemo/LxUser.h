//
//  LxUser.h
//  LxProjectTemplateDemo
//
//  Created by Developer.Lx on 15/12/7.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LxUser : NSObject

@property (nonatomic,copy) NSString * userId;
@property (nonatomic,copy) NSString * username;
@property (nonatomic,copy) NSString * password;
@property (nonatomic,copy) NSString * avatar;
@property (nonatomic,assign) BOOL isFriend;

@end
