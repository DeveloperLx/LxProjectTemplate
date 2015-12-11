//
//  UIColor+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LxTools)

@property (nonatomic,readonly) uint32_t rgbValue;
@property (nonatomic,readonly) uint32_t rgbaValue;
@property (nonatomic,readonly) NSString * htmlColorString;

@property (nonatomic, readonly) CGFloat red;
@property (nonatomic, readonly) CGFloat green;
@property (nonatomic, readonly) CGFloat blue;

@property (nonatomic, readonly) CGFloat hue;
@property (nonatomic, readonly) CGFloat saturation;
@property (nonatomic, readonly) CGFloat brightness;

@property (nonatomic, readonly) CGFloat alpha;

@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;

@property (nonatomic, readonly) UIColor * averageComponentsColor;

+ (UIColor *)pinkColor;

@end
