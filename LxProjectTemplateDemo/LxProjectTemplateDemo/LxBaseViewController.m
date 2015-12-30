//
//  LxBaseViewController.m
//  LxProjectTemplateDemo
//
//  Created by Developer.Lx on 15/12/7.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "LxBaseViewController.h"

@implementation LxBaseViewController

- (void)loadView
{
    UIControl * control = [[UIControl alloc]initWithFrame:[UIScreen mainScreen].bounds];
    control.backgroundColor = [UIColor whiteColor];
    
    [[control rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
       
        Hide_Keyboard;
    }];
    
    self.view = control;
}

- (void)setupNavigationBar{}
- (void)setupViews{}
- (void)layoutViews{}
- (void)setupEvents{}

@end
