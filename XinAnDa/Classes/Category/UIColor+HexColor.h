//
//  UIColor+HexColor.h
//  01-美工的16进制颜色转换Tool
//
//  Created by 周立贺 on 16/5/30.
//  Copyright © 2016年 周立贺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)colorString;

@end
