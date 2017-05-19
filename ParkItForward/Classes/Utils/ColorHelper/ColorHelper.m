//
//  ColorHelper.m
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import "ColorHelper.h"

static NSString * const kInactiveTextColor      = @"#9AA7B2";
static NSString * const kTopGradientColor       = @"#00396B";
static NSString * const kBottomGradientColor    = @"#00274A";
static NSString * const kScoreBtnBGColor        = @"#3082c0";
static NSString * const kLinkBlueColor          = @"#00c0f7";

@implementation ColorHelper

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    UIColor * resColor = [UIColor whiteColor];
    NSInteger lenght = [hexString length];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    switch (lenght) {
        case 7:{
            [scanner setScanLocation:1]; // bypass '#' character
        }
            break;
        default:
            break;
    }
    [scanner scanHexInt:&rgbValue];
    resColor =  [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    return resColor;
}

+ (UIColor *) colorWithHex:(unsigned long long)hexValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.];
}

+ (UIColor*)getActiveTextColor{
    return ([UIColor whiteColor]);
}
+ (UIColor*)getInactiveTextColor{
    UIColor * color =  [ColorHelper colorFromHexString:kInactiveTextColor ];
    return color;
}

+(UIColor*)getTopGradientColor{
    UIColor * color =  [ColorHelper colorFromHexString:kTopGradientColor];
    return color;
}
+(UIColor*)getBottomGradientColor{
    UIColor * color =  [ColorHelper colorFromHexString:kBottomGradientColor];
    return color;
}
+(UIColor*)getScoreBtnBGColor{
    UIColor * color =  [ColorHelper colorFromHexString:kScoreBtnBGColor];
    return color;
}
+(UIColor*)getLinkBlueColor{
    UIColor * color =  [ColorHelper colorFromHexString:kLinkBlueColor];
    return color;
}
@end
