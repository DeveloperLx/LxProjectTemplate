//
//  ProjectConstants.h
//  LxProjectTemplateDemo
//
//  Created by Developer.Lx on 15/12/7.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#ifndef ProjectConstants_h
#define ProjectConstants_h

#import <UIKit/UIKit.h>

static NSString * const SERVER_BASE_ADDRESS = @"http://...";
static NSString * const SERVER_IMAGE_BASE_ADDRESS = @"http://...";

static NSString * const APP_STORE_ADDRESS = @"http://...";
static NSString * const APP_DOWNLOAD_ADDRESS = @"http://...";

static NSString * const SECRET_KEY = @"...";

static CGFloat const CALCULATE_PRECISION = 0.1;
static CGFloat const JPEG_COMPRESSION_QUALITY = 0.6;
static CGFloat const BLACK_COVER_ALPHA = 0.3;

#pragma mark - duration

static NSTimeInterval const COMMON_ANIMATION_DURATION = 0.25;
static NSTimeInterval const COMMON_TOAST_DURATION = 2;
static NSTimeInterval const AUDIO_RECORD_MIN_DURATION = 1;

#pragma mark - string

static NSString * const TOAST_NETWORK_BROKEN = @"网络已中断";
static NSString * const TOAST_CONTENT_CANNOT_BE_EMPTY = @"内容不能为空";

static NSString * const ALERT_LOGOUT = @"确认注销账号？";
static NSString * const ALERT_ENSURE_DELETE = @"确认删除？";
static NSString * const ALERT_ENSURE = @"确定";
static NSString * const ALERT_CANCEL = @"取消";

static NSString * const PLACEHOLDER_USERNAME = @"请输入用户名";
static NSString * const PLACEHOLDER_PASSWORD = @"请输入密码";
static NSString * const PLACTHOLDER_CAPTCHA = @"请输入验证码";
static NSString * const PLACEHOLDER_COMMENT = @"请输入评论";

#pragma mark - font

#define MAIN_TITLE_FONT      [UIFont systemFontOfSize:16]
#define MAIN_CONTENT_FONT    [UIFont systemFontOfSize:14]
#define MAIN_COMMENT_FONT    [UIFont systemFontOfSize:13]

#pragma mark - color

#define MAIN_FONT_COLOR         RGBHEX_COLOR(222222)
#define MAIN_BACKGOUND_COLOR    RGBHEX_COLOR(ffffff)
#define MAIN_BORDER_COLOR       RGBHEX_COLOR(cccccc)

#pragma mark - distance

static CGFloat const MAIN_LEFT_MERGE = 12;

#pragma mark - width

static CGFloat const MAIN_BORDER_WIDTH = 1;

#pragma mark - corner radius

static CGFloat const MAIN_CORNER_RADIUS = 4;

#endif /* ProjectConstants_h */
