//
//  UIDevice+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UIDevice+LxTools.h"

@implementation UIDevice (LxTools)

- (void)rotateToOrientation:(UIDeviceOrientation)orientation
{
    NSArray * selectorNameCharacterArray = @[@"s",@"e",@"t",@"O",@"r",@"i",@"e",@"n",@"t",@"a",@"t",@"i",@"o",@"n",@":"];
    NSString * selectorName = [selectorNameCharacterArray componentsJoinedByString:@""];
    
    SEL selector = NSSelectorFromString(selectorName);
    
    if ([[UIDevice currentDevice] respondsToSelector:selector]) {
        
        typedef void * (* Method)(id, SEL, UIDeviceOrientation);
        Method method = (Method)[UIDevice instanceMethodForSelector:selector];
        
        method([UIDevice currentDevice], selector, orientation);
    }
}

@end
