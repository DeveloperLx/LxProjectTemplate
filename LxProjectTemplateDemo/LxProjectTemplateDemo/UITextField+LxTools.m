//
//  UITextField+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UITextField+LxTools.h"

@implementation UITextField (LxTools)

- (void)selectAllText
{
    self.selectedTextRange = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
}

- (void)setSelectedRange:(NSRange)range
{
    UITextPosition * beginning = self.beginningOfDocument;
    UITextPosition * startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition * endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange * selectedRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    self.selectedTextRange = selectedRange;
}

@end
