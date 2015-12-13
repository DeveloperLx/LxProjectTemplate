//
//  UITableViewCell+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UITableViewCell+LxTools.h"

@implementation UITableViewCell (LxTools)

- (UITableView *)tableView
{
    UIView * superView = self;
    
    while (![superView isKindOfClass:[UITableView class]]) {
        superView = superView.superview;
    }
    
    if ([superView isKindOfClass:[UITableView class]]) {
        return (UITableView *)superView;
    }
    else {
        return nil;
    }
}

- (NSIndexPath *)indexPath
{
    return [self.tableView indexPathForCell:self];
}

- (CGFloat)height
{
    if ([self.tableView.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [self.tableView.delegate tableView:self.tableView heightForRowAtIndexPath:self.indexPath];
    }
    else {
        return CGRectGetHeight(self.frame);
    }
}

@end
