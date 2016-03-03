//
//  UIImage+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LxTools)

- (UIImage *)zoomToMaxWidth:(CGFloat)maxWidth
                  maxHeight:(CGFloat)maxHeight;

+ (UIImage *)singleColorImageWithSize:(CGSize)size color:(UIColor *)color;

//  特定角度旋转、翻转image
- (UIImage *)imageByRotateToOrientation:(UIImageOrientation)orientation;

//  剪切
- (UIImage *)imageByClipedWithRect:(CGRect)clipRect;

- (UIImage *)addSubImage:(UIImage *)subImage atOrigin:(CGPoint)origin;

- (UIImage *)roundedCornerImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;

@property (nonatomic,readonly) CGPoint center;
@property (nonatomic,readonly) CGRect bounds;

@end
