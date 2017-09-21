//
//  SignProtocolView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SignProtocolView.h"

@interface SignProtocolView ()

@end

@implementation SignProtocolView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        __weak __typeof(&*self)ws = self;
        
        CGFloat hw = IphoneSize_Width(18);
        
        UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        rightBtn.selected = false;
        
        rightBtn.layer.cornerRadius = hw/2;
        
        rightBtn.layer.borderColor = [UIColor colorWithHexString:@"#1e78ff"].CGColor;
        
        rightBtn.layer.borderWidth = IphoneSize_Width(0.8);
        
        [rightBtn addTarget:self action:@selector(rightBtnClickWithBtn:) forControlEvents:UIControlEventTouchDown];
        
        [rightBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateSelected];
        
        [self addSubview:rightBtn];
        
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.offset(hw);
            
            make.height.offset(hw);
            
            make.left.equalTo(ws.mas_left);
            
            make.bottom.equalTo(ws.mas_bottom);
            
        }];
        
        UILabel * label = [[UILabel alloc] init];
        
        label.text = @"同意";
        
        label.textColor = [UIColor colorWithHexString:@"#999999"];
        
        label.font = [UIFont systemFontOfSize:IphoneSize_Font(16)];
        
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
    
            make.centerY.equalTo(rightBtn.mas_centerY);
            
            make.left.equalTo(rightBtn.mas_right).offset(IphoneSize_Width(8));
            
        }];
        
        UIButton * protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [protocolBtn setTitle:@"<注册协议>" forState:UIControlStateNormal];
        
        [protocolBtn setTitleColor:[UIColor colorWithHexString:@"#1e78ff"] forState:UIControlStateNormal];
        
        protocolBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(16)];
        
        self.protocolBtn = protocolBtn;
        
        [self addSubview:protocolBtn];
        
        [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(rightBtn.mas_centerY);
            
            make.left.equalTo(label.mas_right).offset(IphoneSize_Width(1));
            
        }];
        
    }
    return self;
}

- (void)rightBtnClickWithBtn:(UIButton *)btn {
    
    btn.selected = !btn.selected;
}

@end
