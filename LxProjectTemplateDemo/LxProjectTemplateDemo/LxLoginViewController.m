//
//  LxLoginViewController.m
//  LxProjectTemplateDemo
//
//  Created by Developer.Lx on 15/12/7.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "LxLoginViewController.h"

@interface LxLoginViewController () <UITextFieldDelegate>
{
    UITextField * _usernameTextField;
    UITextField * _passwordTextField;
    UIButton * _loginButton;
}

@end

@implementation LxLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavigationBar];
    [self setupViews];
    [self layoutViews];
    [self setupEvents];
}

- (void)setupNavigationBar
{
    [super setupNavigationBar];
    
}

- (void)setupViews
{
    [super setupViews];
    
}

- (void)layoutViews
{
    [super layoutViews];
    
}

- (void)setupEvents
{
    [super setupViews];
    
}

#pragma mark - other

- (RACSignal *)loginSignal
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       
        //  login request
        
        return [RACDisposable disposableWithBlock:^{
            
            //  cancel login request
        }];
    }];
}

@end
