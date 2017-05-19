//
//  ColorHelper.h
//  ParkItForward
//
//  Created by Vitaliy Grinevetsky on 18/5/17.
//  Copyright © 2017 FoxSports. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorHelper : NSObject

+ (UIColor *)colorWithHex:(unsigned long long)hexValue;
+ (UIColor *)colorFromHexString:(NSString *)hexString ;

+ (UIColor*)getActiveTextColor;
+ (UIColor*)getInactiveTextColor;

+(UIColor*)getTopGradientColor;
+(UIColor*)getBottomGradientColor;

+(UIColor*)getScoreBtnBGColor;

+(UIColor*)getLinkBlueColor;

@end
