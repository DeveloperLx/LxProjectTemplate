//
//  LxMacros.h
//  LxProjectTemplateDemo
//
//  Created by Developer.Lx on 15/12/7.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - size

#define SCREEN_SIZE     ([UIScreen mainScreen].bounds.size)
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_SCALE    ([UIScreen mainScreen].scale)

#define SCREEN_LONGER_SIDE_LENGTH     (SCREEN_WIDTH > SCREEN_HEIGHT ? SCREEN_WIDTH : SCREEN_HEIGHT)
#define SCREEN_SHORTER_SIDE_LENGTH    (SCREEN_WIDTH > SCREEN_HEIGHT ? SCREEN_HEIGHT : SCREEN_WIDTH)

#define STATEBAR_HEIGHT     20.0

#define NAVIGATIONBAR_HEIGHT        44.0
#define NAVIGATIONBAR_PROMPT_HEIGHT 30.0

#define TOOLBAR_HEIGHT  44.0

#define TABBAR_HEIGHT   49.0

#define KEYBOARD_HEIGHT 216.0
#define KEYBOARD_HORIZONTAL_HEIGHT      162.0
#define KEYBOARD_CANDIDATEWORD_HEIGHT   36.0

#define BARBUTTONITEM_SIDELENGTH    32.0

#define BARBUTTONITEM_EDGE  16.0

#define NAVIGATIONBAR_ICON_SIDELENGTH   20.0
#define TABBAR_ICON_SIDELENGTH  30.0

#define PROGRESSVIEW_HEIGHT 2.0
#define SWITCH_WIDTH    51.0
#define SWITCH_HEIGHT   31.0
#define STEPPER_WIDTH   94.0
#define STEPPER_HEIGHT  29.0
#define SLIDER_WIDTH    100.0
#define SLIDER_HEIGHT   34.0
#define PICKERVIEW_WIDTH    320.0
#define PICKERVIEW_HEIGHT   216.0
#define SPILT_LIST_VIEWCONTROLLER_WIDTH 320.0

#define LABEL_DEFAULT_FONT_SIZE     17.0
#define BUTTON_DEFAULT_FONT_SIZE    18.0
#define ATTRIBUTED_STRING_DEFAULT_FONT_SIZE 12.0
#define ATTRIBUTED_STRING_DEFAULT_HEIGHT    13.8

#pragma mark - iOS version

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS_VERSION_STRING  ([[UIDevice currentDevice] systemVersion])

#define IOS_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define IOS_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IOS_VERSION_LESS_THAN(v)    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define IOS_VERSION_LESS_THAN_OR_EQUAL_TO(v)    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#pragma mark - device

#define IS_IPAD     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE_OR_IPOD   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#pragma mark - bundle info

#define APP_VERSION     [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]


#pragma mark - stringify

#ifndef stringify
    #define stringify               __STRING
#endif

#pragma mark - prevent cycle retain

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif



