//
//  TopBMoneyView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/4.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "TopBMoneyView.h"

@implementation TopBMoneyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGround"]]];
        
        UILabel * labelOne = [[UILabel alloc] init];
        
        labelOne.text = @"0.00";
        
        labelOne.textColor = [UIColor whiteColor];
        
        labelOne.font = [UIFont boldSystemFontOfSize:52];
        
        [self addSubview:labelOne];
        
        __weak __typeof(&*self)ws = self;

        [labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.offset(ws.ZLHW/2);
            
            make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(70));
            
        }];
        
        UILabel * labelTwo = [[UILabel alloc] init];
        
        labelTwo.text = @"当前可借（元）";
        
        labelTwo.textColor = [UIColor whiteColor];
        
        labelTwo.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
        
        [self addSubview:labelTwo];
        
        [labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(labelOne.mas_centerX);
            
            make.top.equalTo(labelOne.mas_bottom);
            
        }];
        
        UILabel * labelThree = [[UILabel alloc] init];
        
        labelThree.text = @"总额度： ¥100000";
        
        labelThree.textColor = [UIColor whiteColor];
        
        labelThree.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];
        
        [self addSubview:labelThree];
        
        [labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(labelTwo.mas_centerX);
            
            make.top.equalTo(labelTwo.mas_bottom).offset(IphoneSize_Height(16));
            
        }];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:@"提额" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor colorWithHexString:@"#fef739"] forState:UIControlStateNormal];
        
        CGFloat h = IphoneSize_Height(35);
        
        btn.layer.borderWidth=IphoneSize_Width(0.5);
        
        btn.layer.cornerRadius = h/2;
        
        btn.layer.borderColor = [UIColor colorWithHexString:@"#fef739"].CGColor;
        
        btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(16)];
        
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(labelThree.mas_centerX);
            
            make.top.equalTo(labelThree.mas_bottom).offset(IphoneSize_Height(30));
            
            make.width.offset(IphoneSize_Width(150));
            
            make.height.offset(IphoneSize_Height(35));
            
        }];


    }
    return self;
}

@end
