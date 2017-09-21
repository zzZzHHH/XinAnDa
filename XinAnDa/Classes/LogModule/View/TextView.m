//
//  TextView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/6/30.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "TextView.h"
#import <Masonry.h>

@interface TextView ()<UITextFieldDelegate>

@property (nonatomic,weak)UILabel * label;

@property (nonatomic,weak)UIView * lineView;

@end

@implementation TextView

+ (instancetype)textViewWithTitle:(NSString *)text {
    
    TextView * view = [[TextView alloc] init];
    
    view.labelTitle = text;
    
    return view;
}

+ (instancetype)textViewWithTitle:(NSString *)text Placeholder:(NSString *)placeholder{
    
    TextView * view = [[TextView alloc] init];
    
    view.labelTitle = text;
    
    view.placeholder = placeholder;
    
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        UILabel * label = [[UILabel alloc] init];
        
        label.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
        
        label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        
        self.label = label;
        
        [self addSubview:label];
        
        UITextField * tf = [[UITextField alloc] init];
        
        tf.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
        
        self.textField = tf;
        
        tf.delegate = self;
        
        [self addSubview:tf];
        
        UIView * lineView = [[UIView alloc] init];
        
        lineView.backgroundColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1.0];
        
        self.lineView = lineView;
        
        [self addSubview:lineView];

    }
    return self;
}

- (void)layoutSubviews{
    
     [super layoutSubviews];
    
    self.label.text = self.labelTitle;
    
    self.textField.placeholder = self.placeholder;
    
    __weak __typeof(&*self)ws = self;
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left);
        
        make.bottom.equalTo(ws.mas_bottom);
        
        make.height.equalTo(ws.mas_height);
        
        make.width.offset(IphoneSize_Width(75));
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.label.mas_right).offset(IphoneSize_Width(15));
        
        make.height.equalTo(ws.label.mas_height);
        
        make.bottom.equalTo(ws.label.mas_bottom);
        
        make.right.equalTo(ws.mas_right);
        
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left);
        
        make.right.equalTo(ws.mas_right);
        
        make.bottom.equalTo(ws.mas_bottom).offset(IphoneSize_Height(-2));
        
        make.height.offset(IphoneSize_Height(0.5));
    }];
}

@end
