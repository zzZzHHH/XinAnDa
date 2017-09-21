//
//  TopJinYuanBaoView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/5.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "TopJinYuanBaoView.h"

@implementation TopJinYuanBaoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGround"]]];
        
        UILabel * labelOne = [[UILabel alloc] init];
        
        labelOne.text = @"0.00";
        
        labelOne.textColor = [UIColor whiteColor];
        
        labelOne.font = [UIFont boldSystemFontOfSize:IphoneSize_Font(52)];
        
        self.labelOne = labelOne;
        
        [self addSubview:labelOne];
        
        __weak __typeof(&*self)ws = self;
        
        [labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.offset(ws.ZLHW/2);
            
            make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(70));
            
        }];
        
        UILabel * labelTwo = [[UILabel alloc] init];
        
        labelTwo.text = @"昨日收益（元）";
        
        labelTwo.textColor = [UIColor whiteColor];
        
        labelTwo.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
        
        self.labelTwo = labelTwo;
        
        [self addSubview:labelTwo];
        
        [labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(labelOne.mas_centerX);
            
            make.top.equalTo(labelOne.mas_bottom);
            
        }];
        
        UILabel * labelThree = [[UILabel alloc] init];
        
        labelThree.text = @"总资产0.00元";
        
        labelThree.textColor = [UIColor whiteColor];
        
        labelThree.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];
        
        self.labelThree = labelThree;
        
        [self addSubview:labelThree];
        
        [labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(labelTwo.mas_centerX);
            
            make.top.equalTo(labelTwo.mas_bottom).offset(IphoneSize_Height(16));
            
        }];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.hidden = YES;
        
        [btn setTitle:@"?" forState:UIControlStateNormal];
        
        [btn setTitleColor:self.backgroundColor forState:UIControlStateNormal];
        
        btn.backgroundColor = [UIColor whiteColor];
        
        CGFloat wh = IphoneSize_Width(20);
        
        btn.layer.cornerRadius = wh/2;
        
        btn.layer.borderColor = [UIColor whiteColor].CGColor;
        
        btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(16)];
        
        self.problemBtn = btn;
        
        [self addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(labelThree.mas_centerY);
            
            make.left.equalTo(labelThree.mas_right);
            
            make.width.offset(wh);
            
            make.height.offset(wh);
            
        }];
        
    }
    return self;
}

@end
