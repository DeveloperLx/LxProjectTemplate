//
//  NSObject+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Property(Class, PropertyName) @(((void)(NO && ((void)[Class nilObject].PropertyName, NO)), # PropertyName))

@interface NSObject (LxTools)

@property (nonatomic,readonly) BOOL available;

+ (instancetype)singletonInstance;

@property (nonatomic,copy) NSString * identifier;
@property (nonatomic,strong) NSMutableDictionary * info;
@property (nonatomic,strong) id associatedObject;

- (NSArray *)wrapToAnArrayIfNotArray;

@property (nonatomic,readonly) BOOL isValidJSONObject;
@property (nonatomic,readonly) NSString * jsonString;
@property (nonatomic,readonly) BOOL isValidXmlObject;
@property (nonatomic,readonly) NSString * xmlString;

@property (nonatomic,readonly) size_t instanceSize;
@property (nonatomic,readonly) NSString * className;

+ (Class)metaClass;

/**
 @return 遵守的协议名称列表，不含父类遵守的协议
 */
+ (NSArray *)conformProtocolArray;

/**
@return 拥有的属性property名称列表，不包含从父类继承的
*/
+ (NSArray *)propertyArray;

/**
 @return 拥有的静态方法名称列表，不含从父类继承的
 */
+ (NSArray *)staticMethodArray;

/**
 @return 拥有的实例方法名称列表，不含从父类继承的
 */
+ (NSArray *)instanceMethodArray;

/**
 @return 拥有的成员变量名称列表，不包含从父类继承的
 */
+ (NSArray *)memberVariableArray;

//  assist macro
+ (instancetype)nilObject;

@end
