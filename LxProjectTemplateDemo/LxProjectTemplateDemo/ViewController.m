//
//  ViewController.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITextField * textField = [[UITextField alloc]init];
    textField.backgroundColor = [UIColor greenColor];
    [self.view addSubview:textField];
    
    
    @weakify(self);
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        @strongify(self);
        make.size.mas_equalTo(CGSizeMake(120, 40));
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
    
    
    [[[NOTIFICATION_CENTER rac_addObserverForName:UIKeyboardWillChangeFrameNotification object:nil] map:^id(NSNotification * notification) {
        
        return @(KeyboardVisibleHeightForNotification(notification));

    }] subscribeNext:^(NSNumber * keyboardVisibleHeight) {
      
        [textField mas_updateConstraints:^(MASConstraintMaker *make) {
           
            @strongify(self);
            make.bottom.equalTo(self.view.mas_bottom).offset(- 20 - keyboardVisibleHeight.floatValue);
        }];
        
        [UIView animateWithDuration:0.25 animations:^{
           
            [textField layoutIfNeeded];
        }];
    }];
    
    
    
    
    
    
    
    
    
    
}

@end
