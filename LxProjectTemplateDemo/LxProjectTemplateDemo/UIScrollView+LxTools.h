//
//  UIScrollView+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (LxTools)

@property (nonatomic,readonly) CGFloat maxContentOffsetX;
@property (nonatomic,readonly) CGFloat maxContentOffsetY;

@property (nonatomic,readonly) CGRect visibleContentFrame;
- (BOOL)isNowVisibleForPoint:(CGPoint)point;
- (BOOL)isNowVisibleForRect:(CGRect)rect;

- (void)scrollToTopAnimated:(BOOL)animated;
- (void)scrollToBottomAnimated:(BOOL)animated;
- (void)scrollToLeftAnimated:(BOOL)animated;
- (void)scrollToRightAnimated:(BOOL)animated;

@end
