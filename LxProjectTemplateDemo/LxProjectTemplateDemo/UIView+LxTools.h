//
//  UIView+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LxTools)

- (UIImage *)snapshotImage;
- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

@property (nonatomic,readonly) UIView * supremeView;
@property (nonatomic,readonly) NSUInteger hierarchyDepth;

- (void)deepTraverseSubviewsWithAction:(void (^)(UIView * subView))action;

- (void)removeAllSubviews;

@property (nonatomic, readonly) UIViewController * viewController;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic,readonly) CGPoint boundsCenter;
@property (nonatomic,readonly) CGFloat square;
@property (nonatomic,readonly) CGFloat perimeter;

- (void)drawLineWithColor:(UIColor *)color width:(CGFloat)width startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end
