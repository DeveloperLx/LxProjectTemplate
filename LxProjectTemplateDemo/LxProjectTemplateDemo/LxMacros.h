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

#define BUNDLE_ID       [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]
#define BUNDLE_NAME     [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]
#define BUNDLE_DISPLAY_NAME             [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
#define BUNDLE_SHORT_VERSION_STRING     [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
#define MAIN_BUNDLE_PATH    [NSBundle mainBundle].bundlePath
#define MAIN_BUNDLE_INFO_DICTIONARY     [NSBundle mainBundle].infoDictionary

#define SANDBOX_PATH                NSHomeDirectory()
#define SANDBOX_DOCUMENTS_PATH      NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
#define SANDBOX_LIBRARY_PATH        NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject
#define SANDBOX_CACHES_PATH         NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject
#define SANDBOX_TMP_PATH            NSTemporaryDirectory()

#pragma mark - device orientation

#define DEVICE_ORIENTATION  [UIDevice currentDevice].orientation    //viewDidAppear后访问才有效

#define DEVICE_ORIENTATION_IS_VERTICAL      (DEVICE_ORIENTATION == UIDeviceOrientationPortrait || DEVICE_ORIENTATION == UIDeviceOrientationPortraitUpsideDown)
#define DEVICE_ORIENTATION_IS_HORIZONTAL    (DEVICE_ORIENTATION == UIDeviceOrientationLandscapeLeft || DEVICE_ORIENTATION == UIDeviceOrientationLandscapeRight)
#define DEVICE_ORIENTATION_IS_FaceUp        (DEVICE_ORIENTATION == UIDeviceOrientationFaceUp)
#define DEVICE_ORIENTATION_IS_FaceDown      (DEVICE_ORIENTATION == UIDeviceOrientationFaceDown)

#pragma mark - stringify

#ifndef stringify
    #define stringify               __STRING
#endif

#define DECLARE_STRING_CONST(str)   static NSString * const str = @stringify(str)

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

#pragma mark - type

#define TYPE_ENCODING_STRING(value)     [NSString stringWithCString:@encode(typeof(value)) encoding:NSUTF8StringEncoding]
#define IS_OBJECT(value)    (strcmp("@", @encode(typeof(value))) == 0)
#define BOOL_STRINGIFY(B)      ((B)?@"YES":@"NO")
#define bool_STRINGIFY(b)      ((b)?@"true":@"false")

#pragma mark - singleton

#define APP_DELEGATE            ((AppDelegate *)[[UIApplication sharedApplication]delegate])
#define SHARED_APPLICATION      [UIApplication sharedApplication]
#define CURRENT_DEVICE          [UIDevice currentDevice]
#define MAIN_BUNDLE             [NSBundle mainBundle]
#define MAIN_SCREEN             [UIScreen mainScreen]
#define FILE_MANAGER            [NSFileManager defaultManager]
#define USER_DEFAULTS           [NSUserDefaults standardUserDefaults]
#define NOTIFICATION_CENTER     [NSNotificationCenter defaultCenter]
#define GENERAL_PASTEBOARD      [UIPasteboard generalPasteboard]
#define SHARED_MENUCONTROLLER   [UIMenuController sharedMenuController]

#pragma mark - thread

#define AT_MAIN_THREAD  [NSThread isMainThread]

#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),block)
#define WAIT_UNTIL_PAUSE(pause) while (pause) {    \
    [[NSRunLoop currentRunLoop]runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]; \
}

#pragma mark - timer

#define ACT_AFTER_SECONDS(seconds, action) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (seconds) * NSEC_PER_SEC, dispatch_get_main_queue(), action)

//  only available at function which return type is void.
#define PREVENT_COMBO_CLICK static BOOL __can_response = YES;    \
if (__can_response == NO) { \
    return; \
}   \
__can_response = NO;    \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
    __can_response = YES;   \
});

#pragma mark - color

#define HSBA_COLOR(h,s,b,a) [UIColor colorWithHue:(h)/100.0f saturation:(s)/100.0f brightness:(b)/100.0f alpha:(a)]
#define RGB_COLOR(r,g,b)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA_COLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGBHEX_COLOR(rgbValue)   [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0] //16进制整数标示的颜色
#define RANDOM_COLOR(alpha) [UIColor colorWithRed:(arc4random()%256/255.0) green:(arc4random()%256/255) blue:(arc4random()%256/255) alpha:(alpha)]

#pragma mark - image

#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]] //UIImage生成后没有缓存,无法识别@2x
#define IMAGE_NAMED(img_name) [UIImage imageNamed:img_name]

#pragma mark - common string

#define TABLE_CELL_REUSE_ID     @"Table_Cell_Reuse_id"
#define COLLECTION_CELL_REUSE_ID    @"Collection_Cell_Reuse_id"

#define METHOD_GET      @"GET"
#define METHOD_POST     @"POST"
#define Http_Prefix     @"http://"
#define Https_Prefix    @"https://"
#define Ftp_Prefix      @"ftp://"
#define Mailto_Prefix   @"mailto://"

#define kCATransitionMoveIn    @"moveIn"
#define kCATransitionReveal    @"reveal"
#define kCATransitionFade      @"fade"
#define kCATransitionPush      @"push"
#define kCATransitionCube      @"cube"
#define kCATransitionPageCurl  @"pageCurl"
#define kCATransitionPageUnCurl    @"pageUnCurl"
#define kCATransitionSuckEffect    @"suckEffect"
#define kCATransitionRippleEffect  @"rippleEffect"
#define kCATransitionOglFlip   @"oglFlip"
#define kCATransitionRotate    @"rotate"
#define kCATransitionCameraIrisHollowOpen  @"cameraIrisHollowOpen"
#define kCATransitionCameraIrisHollowClose @"cameraIrisHollowClose"

#pragma mark - complier warning

#define LX_FUNCTION_UNAVAILABLE(msg)    __attribute__((unavailable(msg)))
#define LX_FUNCTION_NORETURN            __attribute__((noreturn))
#define LX_FUNCTION_CONST               __attribute__((const))
#define LX_FUNCTION_CONSTRUCTOR         __attribute__((constructor))
#define LX_FUNCTION_DESTRUCTOR          __attribute__((destructor))
#define LX_DESIGNATED_INITIALIZER       __attribute__((objc_designated_initializer))
#define LX_STRUCT_PACKED                __attribute__((packed))
#define LX_STRUCT_ALIGNED(num)          __attribute__((aligned(num)))

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
//  int intVariable;
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//  [obj performSelector:@selector(...)]
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated"
//  deprecated code
#pragma clang diagnostic pop

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
//
#pragma clang diagnostic pop

#ifdef __cplusplus
    #define EXTERN  extern "C" __attribute__((visibility ("default")))
#else
    #define EXTERN  extern __attribute__((visibility ("default")))
#endif

//ARC
#if __has_feature(objc_arc)
    //compiling with ARC
#else
    //compiling without ARC
#endif

#if TARGET_OS_MAC

#endif

#if TARGET_OS_WIN32

#endif

#if TARGET_OS_UNIX

#endif

#if TARGET_OS_EMBEDDED

#endif

#if TARGET_OS_IPHONE

#endif

#if TARGET_IPHONE_SIMULATOR

#endif

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
    #if __IPHONE_OS_VERSION_MIN_REQUIRED == __IPHONE_7_0
        #warning 必须运行在 iOS7.0 及以上的系统中
    #endif
    #if __IPHONE_OS_VERSION_MIN_REQUIRED == __IPHONE_7_1
        #warning 必须运行在 iOS7.1 及以上的系统中
    #endif
#endif

#ifdef __MAC_OS_X_VERSION_MIN_REQUIRED
    #if __MAC_OS_X_VERSION_MIN_REQUIRED == __MAC_10_8
        #warning 必须运行在 MacOS 10.8 及以上的系统中
    #endif
    #if __MAC_OS_X_VERSION_MIN_REQUIRED == __MAC_10_9
        #warning 必须运行在 MacOS 10.9 及以上的系统中
    #endif
#endif

#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED

#endif

#ifdef __MAC_OS_X_VERSION_MAX_ALLOWED

#endif

#pragma mark - const value

#define HALF                0.5
#define GOLD_RATIO          ((sqrt(5) - 1)/2)
#define NSCFRangeZero       ((CFRange){0, 0})
#define NSRangeZero         ((NSRange){0, 0})

#define BITS_PER_BYTE       8
#define BYTES_PER_KILOBYTE  1024
#define BYTES_PER_MEGABYTE  (1024 * 1024)
#define BYTES_PER_GIGABYTE  (1024 * 1024 * 1024)
#define BYTES_PER_TERABYTE  (1024 * 1024 * 1024)
#define BYTES_PER_PETABYTE  (1024 * 1024 * 1024)

#define SECONDS_PER_MINUTE  60
#define SECONDS_PER_HOUR    (60 * 60)
#define SECONDS_PER_DAY     (24 * 60 * 60)
#define SECONDS_PER_WEEK    (7 * 24 * 60 * 60)
#define SECONDS_PER_MOUTH   (30 * 24 * 60 * 60)
#define SECONDS_PER_SEASON  (3 * 30 * 24 * 60 * 60)
#define SECONDS_PER_YEAR    (365 * 24 * 60 * 60)

#pragma mark - math

#define ROUNDING_TO_INTEGER(f)  ((int)((f) + 0.5))   //四舍五入到整数位
#define ROUNDING(f,w)       ((int)((f) * pow(10, (w)) + 0.5)/pow(10, (w)))    //四舍五入到小数点后w位
#define RADIAN_OF_DEGREES(d)    (M_PI * (d) / 180.0)
#define DEGREES_OF_RADIAN(r)    ((r * 180.0) / M_PI)
#define IS_INTEGER(num)     ((num) - (int)(num) == 0)
#define FLOAT_EQUAL(float1, float2) (ABS((float1) - (float2)) < 0.1)    //  can custom precise

CG_EXTERN CGFloat ObliqueAngleOfStraightThrough(CGPoint point1, CGPoint point2);   //  [-π/2, 3π/2)
CG_EXTERN CGPoint ControlPointForTheBezierCanThrough3Point(CGPoint point1, CGPoint point2, CGPoint point3);
CG_EXTERN CGFloat DistanceBetweenPoint(CGPoint point1, CGPoint point2);
CG_EXTERN CGPoint CenterPointOf(CGPoint point1, CGPoint point2);

CG_EXTERN CGFloat KeyboardVisibleHeightForNotification(NSNotification * keyboardNotification);
