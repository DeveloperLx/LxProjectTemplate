//
//  UIImage+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UIImage+LxTools.h"

@implementation UIImage (LxTools)

- (UIImage *)zoomToMaxWidth:(CGFloat)maxWidth
                  maxHeight:(CGFloat)maxHeight
{
    if (self.size.width <= 0 || self.size.height <= 0 || maxWidth < 0 || maxHeight < 0) {
        return [UIImage new];
    }
    
    if (maxWidth < 0) {
        maxWidth = CGFLOAT_MAX;
    }
    if (maxHeight < 0) {
        maxHeight = CGFLOAT_MAX;
    }
    
    CGFloat widthHeightRatio = self.size.width / self.size.height;
    CGSize newSize = self.size;
    if (newSize.width > maxWidth) {
        newSize.width = maxWidth;
        newSize.height = newSize.width/widthHeightRatio;
    }
    if (newSize.height > maxHeight) {
        newSize.height = maxHeight;
        newSize.width = newSize.height * widthHeightRatio;
    }
    
    if (ABS(self.size.width - newSize.width) < 1 && ABS(self.size.height - newSize.height) < 1) {
        
        return self;
    }
    else {
        
        CGRect newImageRect = (CGRect){CGPointZero, newSize};
        
        UIGraphicsBeginImageContext(newSize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextClearRect(context, newImageRect);
        CGContextSetInterpolationQuality(context, kCGInterpolationDefault);
        [self drawInRect:newImageRect blendMode:kCGBlendModeNormal alpha:1];
        UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }
}

+ (UIImage *)singleColorImageWithSize:(CGSize)size color:(UIColor *)color
{
    UIGraphicsBeginImageContext(size);
    CGContextRef contentRef = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(contentRef, color.CGColor);
    CGContextSetFillColorWithColor(contentRef, color.CGColor);
    CGContextAddRect(contentRef, CGRectMake(0, 0, size.width, size.height));
    CGContextDrawPath(contentRef, kCGPathFillStroke);
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

//  特定角度旋转、翻转image
- (UIImage *)imageByRotateToOrientation:(UIImageOrientation)orientation
{
    return [UIImage imageWithCGImage:self.CGImage scale:self.scale orientation:orientation];
}

//  剪切
- (UIImage *)imageByClipedWithRect:(CGRect)clipRect
{
    CGRect drawRect = CGRectMake(-clipRect.origin.x , -clipRect.origin.y, self.size.width * self.scale, self.size.height * self.scale);
    
    UIGraphicsBeginImageContext(clipRect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextClearRect(contextRef, CGRectMake(0, 0, clipRect.size.width, clipRect.size.height));
    [self drawInRect:drawRect];
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)addSubImage:(UIImage *)subImage atOrigin:(CGPoint)origin
{
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    [subImage drawInRect:(CGRect){origin, subImage.size}];
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (CGPoint)center
{
    return CGPointMake(self.size.width / 2, self.size.height / 2);
}

- (CGRect)bounds
{
    return CGRectMake(0, 0, self.size.width, self.size.height);
}

@end
