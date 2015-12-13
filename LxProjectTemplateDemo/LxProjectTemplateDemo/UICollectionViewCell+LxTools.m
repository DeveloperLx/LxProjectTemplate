//
//  UICollectionViewCell+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UICollectionViewCell+LxTools.h"

@implementation UICollectionViewCell (LxTools)

- (UICollectionView *)collectionView
{
    UIView * superView = self;
    
    while (![superView isKindOfClass:[UICollectionView class]]) {
        superView = superView.superview;
    }
    
    if ([superView isKindOfClass:[UICollectionView class]]) {
        return (UICollectionView *)superView;
    }
    else {
        return nil;
    }
}

- (NSIndexPath *)indexPath
{
    return [self.collectionView indexPathForCell:self];
}

@end
