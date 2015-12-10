//
//  NSObject+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "NSObject+LxTools.h"
#import <objc/runtime.h>

@implementation NSObject (LxTools)

+ (instancetype)singletonInstance
{
    static id singletonInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        singletonInstance = [[self alloc]init];
    });
    
    return singletonInstance;
}

- (NSString *)identifier
{
    return objc_getAssociatedObject(self, @selector(identifier));
}

- (void)setIdentifier:(NSString *)identifier
{
    objc_setAssociatedObject(self, @selector(identifier), identifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSMutableDictionary *)info
{
    NSMutableDictionary * info = objc_getAssociatedObject(self, @selector(info));
    
    if (info == nil) {
        info = [[NSMutableDictionary alloc]init];
        objc_setAssociatedObject(self, @selector(info), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return info;
}

- (void)setInfo:(NSMutableDictionary *)info
{
    objc_setAssociatedObject(self, @selector(info), info, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject
{
    return objc_getAssociatedObject(self, @selector(associatedObject));
}

- (void)setAssociatedObject:(id)associatedObject
{
    objc_setAssociatedObject(self, @selector(associatedObject), associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)wrapToAnArrayIfNotArray
{
    if ([self isKindOfClass:[NSMutableArray class]]) {
        return (NSMutableArray *)self;
    }
    else if ([self isKindOfClass:[NSArray class]]) {
        return (NSArray *)self;
    }
    else {
        return [NSArray arrayWithObject:self];
    }
}

- (BOOL)available
{
    return (self == nil || self == NULL || self == (id)kCFNull || [self isKindOfClass:[NSNull class]] || self == [NSNull null]) == NO;
}

- (BOOL)isValidJSONObject
{
    return [NSJSONSerialization isValidJSONObject:self];
}

- (NSString *)jsonString
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError * error = nil;
        NSData * jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        if (jsonData) {
            return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        else if (error) {
            return error.description;
        }
        else {
            return @"Can't express with a json string!";
        }
    }
    else {
        return @"Can't express with a json string!";
    }
}

- (BOOL)isValidXmlObject
{
    return [NSPropertyListSerialization propertyList:self isValidForFormat:NSPropertyListXMLFormat_v1_0];
}

- (NSString *)xmlString
{
    NSError * error = nil;
    NSData * xmlData = [NSPropertyListSerialization dataWithPropertyList:self format:NSPropertyListXMLFormat_v1_0 options:kCFPropertyListMutableContainers error:&error];
    
    if (xmlData) {
        return [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
    }
    else if (error) {
        return error.description;
    }
    else {
        return @"Can't express with a xml string!";
    }
}

- (size_t)instanceSize
{
    return class_getInstanceSize([self class]);
}

- (NSString *)className
{
    return NSStringFromClass([self class]);
}

+ (Class)metaClass
{
    return objc_getMetaClass(NSStringFromClass(self).UTF8String);
}

+ (NSArray *)conformProtocolArray
{
    unsigned int protocolCount = 0;
    
    Protocol * __unsafe_unretained * protocolList = class_copyProtocolList([self class], &protocolCount);
    
    if (protocolCount <= 0) {
        return nil;
    }
    
    NSMutableArray * conformsProtocolArray = [NSMutableArray array];
    
    for (int i = 0; i < protocolCount; i++) {
        
        [conformsProtocolArray addObject:[NSString stringWithUTF8String:protocol_getName(protocolList[i])]];
    }
    
    free(protocolList);
    
    return [NSArray arrayWithArray:conformsProtocolArray];
}

+ (NSArray *)propertyArray
{
    unsigned int propertiesCount = 0;
    objc_property_t * propertyList = class_copyPropertyList([self class], &propertiesCount);
    
    NSMutableArray * propertyArray = [NSMutableArray array];
    
    for (int i = 0; i < propertiesCount; i++) {
        
        [propertyArray addObject:[NSString stringWithUTF8String:property_getName(propertyList[i])]];
    }
    
    free(propertyList);
    
    return [NSArray arrayWithArray:propertyArray];
}

+ (NSArray *)staticMethodArray
{
    return [[[self class] metaClass] instanceMethodArray];
}

+ (NSArray *)instanceMethodArray
{
    unsigned int methodCount = 0;
    
    Method * methodList = class_copyMethodList([self class], &methodCount);
    
    if (methodCount <= 0) {
        return nil;
    }
    
    NSMutableArray * methodArray = [NSMutableArray array];
    
    for (int i = 0; i < methodCount; i++) {
        SEL methodSEL = method_getName(*(methodList + i));
        [methodArray addObject:NSStringFromSelector(methodSEL)];
    }
    
    free(methodList);
    
    return [NSArray arrayWithArray:methodArray];
}

+ (NSArray *)memberVariableArray
{
    unsigned int ivarCount = 0;
    
    Ivar * ivarList = class_copyIvarList([self class], &ivarCount);
    
    if (ivarCount <= 0) {
        return nil;
    }
    
    NSMutableArray * memberVariableArray = [NSMutableArray array];
    
    for (int i = 0; i < ivarCount; i++) {
        
        [memberVariableArray addObject:[NSString stringWithUTF8String:ivar_getName(ivarList[i])]];
    }
    
    free(ivarList);
    
    return [NSArray arrayWithArray:memberVariableArray];
}

@end
