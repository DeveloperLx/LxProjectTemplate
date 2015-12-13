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

    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        double delayInSeconds = 3;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            LxPrintAnything(A);
            [subscriber sendNext:@"A"];
        });
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        double delayInSeconds = 2;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            LxPrintAnything(B);
            [subscriber sendNext:@"B"];
        });
        return nil;
    }];
    
    [self rac_liftSelector:@selector(doA:withB:) withSignals:signalA, signalB, nil];
    
    
}

- (void)doA:(NSString *)A withB:(NSString *)B
{
    NSLog(@"A:%@ and B:%@", A, B);
}

@end
