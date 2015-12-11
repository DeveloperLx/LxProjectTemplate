//
//  NSMutableArray+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "NSMutableArray+LxTools.h"

@implementation NSMutableArray (LxTools)

- (void)disorder
{
    [self sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return (NSComparisonResult)(arc4random()%3 - 1);
    }];
}

- (void)reverse
{
    for (int i = 0; i < self.count/2; i++) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:self.count - 1 - i];
    }
}

@end
