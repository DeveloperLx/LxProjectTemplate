//
//  UIScrollView+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UIScrollView+LxTools.h"

@implementation UIScrollView (LxTools)

- (CGFloat)maxContentOffsetX
{
    return MAX(0, self.contentSize.width - CGRectGetWidth(self.frame));
}

- (CGFloat)maxContentOffsetY
{
    return MAX(0, self.contentSize.height - CGRectGetHeight(self.frame));
}

- (CGRect)visibleContentFrame
{
    return CGRectMake(self.contentOffset.x, self.contentOffset.y, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

- (BOOL)isNowVisibleForPoint:(CGPoint)point
{
    return CGRectContainsPoint(self.visibleContentFrame, point);
}

- (BOOL)isNowVisibleForRect:(CGRect)rect
{
    return CGRectContainsRect(self.visibleContentFrame, rect);
}

- (void)scrollToTopAnimated:(BOOL)animated
{
    CGPoint contentOffset = self.contentOffset;
    contentOffset.y = 0 - self.contentInset.top;
    [self setContentOffset:contentOffset animated:animated];
}

- (void)scrollToBottomAnimated:(BOOL)animated
{
    CGPoint contentOffset = self.contentOffset;
    contentOffset.y = self.contentSize.height - CGRectGetHeight(self.frame) + self.contentInset.bottom;
    [self setContentOffset:contentOffset animated:animated];
}

- (void)scrollToLeftAnimated:(BOOL)animated
{
    CGPoint contentOffset = self.contentOffset;
    contentOffset.x = 0 - self.contentInset.left;
    [self setContentOffset:contentOffset animated:animated];
}

- (void)scrollToRightAnimated:(BOOL)animated
{
    CGPoint contentOffset = self.contentOffset;
    contentOffset.x = self.contentSize.width - CGRectGetWidth(self.frame) + self.contentInset.right;
    [self setContentOffset:contentOffset animated:animated];
}

@end
