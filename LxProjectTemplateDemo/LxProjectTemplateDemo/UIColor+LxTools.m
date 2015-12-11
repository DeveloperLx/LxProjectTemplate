//
//  UIColor+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UIColor+LxTools.h"

@implementation UIColor (LxTools)

- (uint32_t)rgbValue {
    CGFloat r = 0, g = 0, b = 0, a = 0;
    [self getRed:&r green:&g blue:&b alpha:&a];
    int8_t red = r * 255;
    uint8_t green = g * 255;
    uint8_t blue = b * 255;
    return (red << 16) + (green << 8) + blue;
}

- (uint32_t)rgbaValue {
    CGFloat r = 0, g = 0, b = 0, a = 0;
    [self getRed:&r green:&g blue:&b alpha:&a];
    int8_t red = r * 255;
    uint8_t green = g * 255;
    uint8_t blue = b * 255;
    uint8_t alpha = a * 255;
    return (red << 24) + (green << 16) + (blue << 8) + alpha;
}

- (NSString *)htmlColorString
{
    CGColorRef color = self.CGColor;
    size_t count = CGColorGetNumberOfComponents(color);
    const CGFloat * components = CGColorGetComponents(color);
    static NSString * stringFormat = @"%02x%02x%02x";
    NSString * htmlColorString = nil;
    
    if (count == 2) {
        NSUInteger white = (NSUInteger)(components[0] * 255.0f);
        htmlColorString = [NSString stringWithFormat:stringFormat, white, white, white];
    }
    else if (count == 4) {
        htmlColorString = [NSString stringWithFormat:stringFormat,
               (NSUInteger)(components[0] * 255.0f),
               (NSUInteger)(components[1] * 255.0f),
               (NSUInteger)(components[2] * 255.0f)];
    }
    
    return htmlColorString;
}

- (CGFloat)red {
    CGFloat r = 0, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return r;
}

- (CGFloat)green {
    CGFloat r, g = 0, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return g;
}

- (CGFloat)blue {
    CGFloat r, g, b = 0, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return b;
}

- (CGFloat)alpha {
    return CGColorGetAlpha(self.CGColor);
}

- (CGFloat)hue {
    CGFloat h = 0, s, b, a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return h;
}

- (CGFloat)saturation {
    CGFloat h, s = 0, b, a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return s;
}

- (CGFloat)brightness {
    CGFloat h, s, b = 0, a;
    [self getHue:&h saturation:&s brightness:&b alpha:&a];
    return b;
}

- (CGColorSpaceModel)colorSpaceModel {
    return CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
}

- (UIColor *)averageComponentsColor
{
    CGFloat redValue = 0, greenValue = 0, blueValue = 0, alphaValue = 0, averageValue = 0;
    [self getRed:&redValue green:&greenValue blue:&blueValue alpha:&alphaValue];
    averageValue = (redValue + greenValue + blueValue) / 3;
    return [UIColor colorWithRed:averageValue green:greenValue blue:blueValue alpha:alphaValue];
}

+ (UIColor *)pinkColor
{
    return [UIColor colorWithRed:0.984 green:0.725 blue:0.875 alpha:1.000];
}

@end
