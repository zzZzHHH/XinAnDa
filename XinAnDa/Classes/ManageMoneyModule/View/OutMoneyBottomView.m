//
//  OutMoneyBottomView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/7.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "OutMoneyBottomView.h"

@implementation OutMoneyBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel * timeLabel = [self labelWithText:@"到账时间" Color:@"#666666" Size:14];
        
        UILabel * timesLabel = [self labelWithText:@"快速取现(本月还剩8次)" Color:@"#666666" Size:14];
        
        __weak __typeof(&*self)ws = self;

        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(14));
            
            make.top.equalTo(ws.mas_top);
            
        }];
        
        [timesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(ws.mas_right).offset(IphoneSize_Width(-14));
            
            make.top.equalTo(ws.mas_top);
            
        }];
        
        UIView * moneyView = [[UIView alloc] init];
        
        moneyView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:moneyView];
        
        [moneyView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.offset(ScreenW);
            
            make.height.offset(IphoneSize_Height(50));
            
            make.left.equalTo(ws.mas_left);
            
            make.top.equalTo(timeLabel.mas_bottom).offset(IphoneSize_Height(14));
            
        }];
        
        UILabel * label = [[UILabel alloc] init];
        
        label.text = @"金额";
        
        label.textColor = [UIColor colorWithHexString:@"#333333"];
        
        label.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
        
        [moneyView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(14));
            
            make.centerY.equalTo(moneyView.mas_centerY);
            
        }];
        
        UITextField * tf = [[UITextField alloc] init];
        
        tf.placeholder = @"可取现金0元（100元起去）";
        
        tf.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];

        [moneyView addSubview:tf];
        
        [tf mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(label.mas_right).offset(IphoneSize_Width(16));
            
            make.centerY.equalTo(moneyView.mas_centerY);
        }];
        
        UIButton * rulerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [rulerBtn setTitle:@"收益及取现规则" forState:UIControlStateNormal];
        
        [rulerBtn setTitleColor:[UIColor colorWithHexString:@"#1e78ff"] forState:UIControlStateNormal];
        
        rulerBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
        
        [self addSubview:rulerBtn];
        
        [rulerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.equalTo(ws.mas_centerX);
            
            make.bottom.equalTo(ws.mas_bottom).offset(IphoneSize_Width(-46));
            
        }];
        
        UIButton * rightAwayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        rightAwayBtn.backgroundColor = [UIColor colorWithHexString:@"#1e78ff" alpha:1.0];
        
        rightAwayBtn.layer.cornerRadius = IphoneSize_Width(5.0);
        
        [rightAwayBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [rightAwayBtn setTitle:@"本次取现最低100.00元" forState:UIControlStateNormal];
        
        rightAwayBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];
        
        [self addSubview:rightAwayBtn];
        
        [rightAwayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.offset(IphoneSize_Height(44));
            
            make.left.equalTo(self.mas_left).offset(IphoneSize_Width(27));
            
            make.width.offset(ScreenW - IphoneSize_Width(54));
            
            make.bottom.equalTo(rulerBtn.mas_top).offset(IphoneSize_Height(-24));
        }];

    }
    return self;
}

- (UILabel *)labelWithText:(NSString *)text Color:(NSString *)color Size:(CGFloat)size{
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = text;
    
    label.textColor = [UIColor colorWithHexString:color];
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(size)];
    
    [self addSubview:label];
    
    return label;
}

@end
