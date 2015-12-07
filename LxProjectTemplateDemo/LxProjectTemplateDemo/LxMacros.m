//
//  LxMacros.m
//  LxProjectTemplateDemo
//
//  Created by Developer.Lx on 15/12/7.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "LxMacros.h"

CGFloat ObliqueAngleOfStraightThrough(CGPoint point1, CGPoint point2)   //  [-π/2, 3π/2)
{
    CGFloat obliqueRatio = 0;
    CGFloat obliqueAngle = 0;
    
    if (point1.x > point2.x) {
        
        obliqueRatio = (point2.y - point1.y) / (point2.x - point1.x);
        obliqueAngle = atan(obliqueRatio);
    }
    else if (point1.x < point2.x) {
        
        obliqueRatio = (point2.y - point1.y) / (point2.x - point1.x);
        obliqueAngle = M_PI + atan(obliqueRatio);
    }
    else if (point2.y - point1.y >= 0) {
        
        obliqueAngle = M_PI/2;
    }
    else {
        obliqueAngle = -M_PI/2;
    }
    
    return obliqueAngle;
}

CGPoint ControlPointForTheBezierCanThrough3Point(CGPoint point1, CGPoint point2, CGPoint point3)
{
    return CGPointMake(2 * point2.x - (point1.x + point3.x) / 2, 2 * point2.y - (point1.y + point3.y) / 2);
}

CGFloat DistanceBetweenPoint(CGPoint point1, CGPoint point2)
{
    return sqrt((point1.x - point2.x) * (point1.x - point2.x) + (point1.y - point2.y) * (point1.y - point2.y));
}

CGPoint CenterPointOf(CGPoint point1, CGPoint point2)
{
    return CGPointMake((point1.x + point2.x) / 2, (point1.y + point2.y) / 2);
}

CGFloat KeyboardVisibleHeightForNotification(NSNotification * keyboardNotification)
{
    CGRect keyboardFrame = [keyboardNotification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardVisibleHeight = 0;
    if (ABS(CGRectGetWidth(keyboardFrame) - SCREEN_LONGER_SIDE_LENGTH) < 1) {
        keyboardVisibleHeight = ABS(MIN(SCREEN_WIDTH, SCREEN_HEIGHT) - CGRectGetMinY(keyboardFrame));
    }
    else if (ABS(CGRectGetHeight(keyboardFrame) - SCREEN_LONGER_SIDE_LENGTH) < 1) {
        keyboardVisibleHeight = ABS(CGRectGetMinX(keyboardFrame) + CGRectGetWidth(keyboardFrame));
        if (ABS(keyboardVisibleHeight - SCREEN_SHORTER_SIDE_LENGTH) < 1) {
            keyboardVisibleHeight = CGRectGetWidth(keyboardFrame);
        }
        else if (keyboardVisibleHeight - SCREEN_SHORTER_SIDE_LENGTH > 1) {
            keyboardVisibleHeight = 0;
        }
    }
    else if (ABS(CGRectGetWidth(keyboardFrame) - SCREEN_SHORTER_SIDE_LENGTH) < 1) {
        keyboardVisibleHeight = ABS(SCREEN_LONGER_SIDE_LENGTH - CGRectGetMinY(keyboardFrame));
    }
    
    return keyboardVisibleHeight;
}