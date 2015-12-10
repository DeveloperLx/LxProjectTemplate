//
//  UIWebView+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UIWebView+LxTools.h"

@implementation UIWebView (LxTools)

- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(CGRect)frame
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:WebViewDidAlertMessageNotification
     object:self
     userInfo:@{@"message":message}];
}

@end
