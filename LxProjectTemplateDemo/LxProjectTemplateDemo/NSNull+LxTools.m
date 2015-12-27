//
//  NSNull+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by 李晛 on 15/12/27.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "NSNull+LxTools.h"

@implementation NSNull (LxTools)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class cls = [self class];
        
        
        SEL originalSelector = @selector(forwardInvocation:);
        SEL swizzledSelector = @selector(swizzled_forwardInvocation:);
        
        Method originalMethod = class_getInstanceMethod(cls, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    
        BOOL success = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (success) {
            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
        
        originalSelector = @selector(methodSignatureForSelector:);
        swizzledSelector = @selector(swizzled_methodSignatureForSelector:);
        
        originalMethod = class_getInstanceMethod(cls, originalSelector);
        swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
        
        success = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (success) {
            class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - method swizzling

- (void)swizzled_forwardInvocation:(NSInvocation *)anInvocation
{
    if ([self respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:self];
    }
}

- (NSMethodSignature *)swizzled_methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature * methodSignature = [NSNull instanceMethodSignatureForSelector:aSelector];
    if (methodSignature == nil) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"@^v^c"];
    }
    return methodSignature;
}

@end
