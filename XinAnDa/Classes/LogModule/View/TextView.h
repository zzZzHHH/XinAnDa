//
//  TextView.h
//  XinAnDa
//
//  Created by 周立贺 on 17/6/30.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextView : UIView

@property (nonatomic,strong)NSString *labelTitle;

@property (nonatomic,strong)NSString *placeholder;

@property (nonatomic,weak)UITextField * textField;

+ (instancetype)textViewWithTitle:(NSString *)text;

+ (instancetype)textViewWithTitle:(NSString *)text Placeholder:(NSString *)placeholder;

@end
