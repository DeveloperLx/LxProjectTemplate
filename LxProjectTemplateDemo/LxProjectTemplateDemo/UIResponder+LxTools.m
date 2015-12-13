//
//  UIResponder+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/13.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UIResponder+LxTools.h"

@implementation UIResponder (LxTools)

static __weak UIResponder * _currentFirstResponder = nil;

+ (UIResponder *)currentFirstResponder
{
    _currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    return _currentFirstResponder;
}

- (void)findFirstResponder:(id)sender
{
    _currentFirstResponder = self;
}

@end
