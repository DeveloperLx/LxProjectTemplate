//
//  UIView+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UIView+LxTools.h"

@implementation UIView (LxTools)

- (UIImage *)snapshotImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates
{
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)] == NO) {
        return [self snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIView *)supremeView
{
    UIView * supremeView = self;
    while (supremeView) {
        if (supremeView.superview) {
            supremeView = supremeView.superview;
        }
        else {
            return supremeView;
        }
    }
    return self;
}

- (NSUInteger)hierarchyDepth
{
    NSUInteger hierarchyDepth = 0;
    UIView * view = self;
    while (view.superview) {
        view = view.superview;
        hierarchyDepth++;
    }
    return hierarchyDepth;
}

- (void)deepTraverseSubviewsWithAction:(void (^)(UIView * subView))action
{
    NSParameterAssert(action);
    
    action(self);
    for (UIView * v in self.subviews) {
        [v deepTraverseSubviewsWithAction:action];
    }
}

- (void)removeAllSubviews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (UIViewController *)viewController
{
    for (UIView * view = self; view != nil; view = view.superview) {
        UIResponder  *nextResponder = view.nextResponder;
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    self.frame = (CGRect){origin, self.frame.size};
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    self.frame = (CGRect){self.frame.origin, size};
}

- (CGFloat)left
{
    return CGRectGetMinX(self.frame);
}

- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - CGRectGetWidth(self.frame);
    self.frame = frame;
}

- (CGFloat)top
{
    return CGRectGetMinY(self.frame);
}

- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - CGRectGetHeight(self.frame);
    self.frame = frame;
}

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.width = height;
    self.frame = frame;
}

- (CGPoint)boundsCenter
{
    return CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2);
}

- (CGFloat)square
{
    return CGRectGetWidth(self.frame) * CGRectGetHeight(self.frame);
}

- (CGFloat)perimeter
{
    return (CGRectGetWidth(self.frame) + CGRectGetHeight(self.frame)) * 2;
}

- (void)drawLineWithColor:(UIColor *)color width:(CGFloat)width startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    CGFloat length = sqrt((endPoint.x - startPoint.x) * (endPoint.x - startPoint.x) + (endPoint.y - startPoint.y) * (endPoint.y - startPoint.y));
    CGFloat radian = atan((endPoint.y - startPoint.y)/(endPoint.x - startPoint.x));
    
    if (startPoint.x > endPoint.x) {
        startPoint = endPoint;
    }
    
    CALayer * lineLayer = [CALayer layer];
    lineLayer.opaque = NO;
    lineLayer.backgroundColor = color.CGColor;
    lineLayer.anchorPoint = CGPointMake(0, 0.5);
    lineLayer.frame = CGRectMake(startPoint.x, startPoint.y - 0.5 * width, length, width);
    lineLayer.affineTransform = CGAffineTransformRotate(lineLayer.affineTransform, radian);
    [self.layer addSublayer:lineLayer];
}

@end
