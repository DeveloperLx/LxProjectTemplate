//
//  UIWebView+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const WebViewDidAlertMessageNotification = @"WebViewDidAlertMessageNotification";

@interface UIWebView (LxTools)

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(CGRect)frame;

@end
