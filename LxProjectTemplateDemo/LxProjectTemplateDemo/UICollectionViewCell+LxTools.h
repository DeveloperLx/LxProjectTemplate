//
//  UICollectionViewCell+LxTools.h
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (LxTools)

@property (nonatomic,readonly) UICollectionView * collectionView;
@property (nonatomic,readonly) NSIndexPath * indexPath;

@end
