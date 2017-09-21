//
//  DetailCenterBottomView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "DetailCenterBottomView.h"

@interface DetailCenterBottomView()

@property (nonatomic,weak)UILabel *topLabel;

@property (nonatomic,weak)UILabel *centerLabel;

@property (nonatomic,weak)UILabel *bottomLabel;

@end

@implementation DetailCenterBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {

        self.backgroundColor = [UIColor whiteColor];
        
        UILabel * topLabel = [self labelWithTitle:@"还款中" Font:        IphoneSize_Font(14) Color:@"#1e78ff"];
        
        self.topLabel = topLabel;
        
        [self addSubview:topLabel];
        
        UILabel * centerLabel = [self labelWithTitle:@"已还0/3期" Font:        IphoneSize_Font(14) Color:@"#333333"];
        
        self.centerLabel = centerLabel;
        
        [self addSubview:centerLabel];
        
        UILabel * bottomLabel = [self labelWithTitle:@"已收本金0.00元，已收利息0.00元" Font:IphoneSize_Font(14) Color:@"#666666"];
        
        self.bottomLabel = bottomLabel;
        
        [self addSubview:bottomLabel];
        
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    __weak __typeof(&*self)ws = self;

    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(ws.mas_left).offset(14);
        
        make.top.equalTo(ws.mas_top).offset(16);
    }];
    
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.topLabel.mas_left);
        
        make.top.equalTo(ws.topLabel.mas_bottom).offset(16);
    }];
    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.centerLabel.mas_left);
        
        make.top.equalTo(ws.centerLabel.mas_bottom).offset(16);
    }];
}

- (UILabel *)labelWithTitle:(NSString *)title Font:(CGFloat)font Color:(NSString *)color{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = title;
    
    label.textColor = [UIColor colorWithHexString:color];
    
    label.font = [UIFont systemFontOfSize:font];
    
    return label;
}

@end
