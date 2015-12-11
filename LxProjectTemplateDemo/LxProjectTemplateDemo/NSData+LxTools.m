//
//  NSData+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/10.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "NSData+LxTools.h"

#define Base64EncodingOptions   (NSDataBase64Encoding64CharacterLineLength)
#define Base64DecodingOptions   (NSDataBase64DecodingIgnoreUnknownCharacters)

@implementation NSData (LxTools)

- (NSString *)UTF8String
{
    return [[NSString alloc]initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSString *)bytesDescription
{
    NSString * bytesDescription = self.description;
    bytesDescription = [bytesDescription stringByReplacingOccurrencesOfString:@"[ <>]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, bytesDescription.length)];
    return bytesDescription;
}

+ (NSData *)dataWithBytesDescription:(NSString *)bytesDescription
{
    char dataBytes[bytesDescription.length / 2 + bytesDescription.length % 2];
    bzero(dataBytes, sizeof(dataBytes));
    
    for (int i = 0; i < bytesDescription.length; i += 2) {
        
        NSString * hexSubString = [bytesDescription substringWithRange:NSMakeRange(i, 2)];
        NSScanner * bytesDescriptionScanner = [NSScanner scannerWithString:hexSubString];
        unsigned int hexValue = 0;
        [bytesDescriptionScanner scanHexInt:&hexValue];
        dataBytes[i/2] = hexValue;
    }
    
    NSData * data = [NSData dataWithBytes:dataBytes length:sizeof(dataBytes)];
    
    return data;
}

#pragma mark - cipher

- (NSData *)base64Data
{
    return [self base64EncodedDataWithOptions:Base64EncodingOptions];
}

- (NSData *)debase64Data
{
    return [[NSData alloc] initWithBase64EncodedData:self options:Base64DecodingOptions];
}

- (NSString *)base64String
{
    return [self base64EncodedStringWithOptions:Base64EncodingOptions];
}

- (NSString *)debase64String
{
    NSData * debase64Data = [[NSData alloc] initWithBase64EncodedData:self options:Base64DecodingOptions];
    
    if (debase64Data.length > 0) {
        return [[NSString alloc]initWithData:debase64Data encoding:NSUTF8StringEncoding];
    }
    else {
        return nil;
    }
}

@end
