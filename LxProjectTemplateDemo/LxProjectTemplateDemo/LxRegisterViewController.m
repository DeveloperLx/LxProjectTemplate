//
//  LxRegisterViewController.m
//  LxProjectTemplateDemo
//
//  Created by Developer.Lx on 15/12/7.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "LxRegisterViewController.h"

@interface LxRegisterViewController () <UITextFieldDelegate>
{
    UITextField * _usernameTextField;
    UITextField * _passwordTextField;
    UIButton * _registerButton;
}

@end

@implementation LxRegisterViewController

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

- (RACSignal *)registerSignal
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        //  register request
        
        return [RACDisposable disposableWithBlock:^{
            
            //  cancel register request
        }];
    }];
}

@end
