//
//  UIColor+HexColor.m
//  01-美工的16进制颜色转换Tool
//
//  Created by 周立贺 on 16/5/30.
//  Copyright © 2016年 周立贺. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)
+ (UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha{
    
    //如果是0X开头0x开头或者#开头的.从第二位截到最后一位
    if ([colorString hasPrefix:@"0x"] || [colorString hasPrefix:@"0X"]) {
        
        colorString = [colorString substringFromIndex:2];
    }
    if ([colorString hasPrefix:@"#"]) {
        
        colorString = [colorString substringFromIndex:1];
    }
    
    //依次取出两位
    NSRange range ;
    range.length = 2;
    range.location = 0;
    NSString * rColorString = [colorString substringWithRange:range];
    range.location = 2;
    NSString * gColorString = [colorString substringWithRange:range];
    range.location = 4;
    NSString * bColorString = [colorString substringWithRange:range];
    
    //把字符串转换为10进制
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rColorString] scanHexInt:&r];
    [[NSScanner scannerWithString:gColorString] scanHexInt:&g];
    [[NSScanner scannerWithString:bColorString] scanHexInt:&b];
    
    //返回
    return [UIColor colorWithRed:(float)r/255.0 green:(float)g/255.0 blue:(float)b/255.0 alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)colorString{
    return [self colorWithHexString:colorString alpha:1.0];
    
}
@end
