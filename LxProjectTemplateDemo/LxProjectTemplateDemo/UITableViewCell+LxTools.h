//
//  UITableViewCell+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (LxTools)

@property (nonatomic,readonly) UITableView * tableView;
@property (nonatomic,readonly) NSIndexPath * indexPath;
@property (nonatomic,readonly) CGFloat height;

@end
