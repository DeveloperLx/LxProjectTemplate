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

    UIStackView * stackView = [[UIStackView alloc]init];
    stackView.backgroundColor = RANDOM_COLOR(1);
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.spacing = 30;
    [self.view addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(30, 30, 30, 30));
    }];
    
    UIView * stackViewBackgroundView = [[UIView alloc]init];
    stackViewBackgroundView.backgroundColor = RANDOM_COLOR(1);
    [self.view insertSubview:stackViewBackgroundView atIndex:0];
    
    [stackViewBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(stackView);
    }];
    
    UIView * subview1 = [[UIView alloc]init];
    subview1.backgroundColor = RANDOM_COLOR(1);
    [stackView addArrangedSubview:subview1];
    
    [subview1 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.mas_equalTo(arc4random()%200 + 80);
//        make.size.mas_equalTo(CGSizeMake(arc4random()%60 + 10, arc4random()%60 + 10));
    }];

    UIView * subview2 = [[UIView alloc]init];
    subview2.backgroundColor = RANDOM_COLOR(1);
    [stackView addArrangedSubview:subview2];
    
    [subview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(arc4random()%200 + 80);
//        make.size.mas_equalTo(CGSizeMake(arc4random()%60 + 10, arc4random()%60 + 10));
    }];
    
    UIView * subview3 = [[UIView alloc]init];
    subview3.backgroundColor = RANDOM_COLOR(1);
    [stackView addArrangedSubview:subview3];
    
    [subview3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(arc4random()%200 + 80);
//        make.size.mas_equalTo(CGSizeMake(arc4random()%60 + 10, arc4random()%60 + 10));
    }];
    
    UIView * subview4 = [[UIView alloc]init];
    subview4.backgroundColor = RANDOM_COLOR(1);
    [stackView addArrangedSubview:subview4];
    
    [subview4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(arc4random()%200 + 80);
//        make.size.mas_equalTo(CGSizeMake(arc4random()%60 + 10, arc4random()%60 + 10));
    }];
    

    
}

@end
