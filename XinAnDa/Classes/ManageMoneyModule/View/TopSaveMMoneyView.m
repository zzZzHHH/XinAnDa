//
//  TopSaveMMoneyView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/6.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "TopSaveMMoneyView.h"

@implementation TopSaveMMoneyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UIView * bankView = [self setUpBankView];
        
        __weak __typeof(&*self)ws = self;

        [bankView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(ws.mas_left);
            
            make.width.offset(ScreenW);
            
            make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(10));
            
            make.height.offset(IphoneSize_Height(65));
            
        }];
        
        UILabel * label = [[UILabel alloc] init];
        
        label.text = @"首笔限额20万，日限额20万";
        
        label.font = [UIFont systemFontOfSize:IphoneSize_Font(13)];
        
        label.textColor = [UIColor colorWithHexString:@"#999999"];
        
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(14));
            
            make.top.equalTo(bankView.mas_bottom).offset(IphoneSize_Height(10));
            
        }];
        
        UIView * moneyView = [self setUpMoneyView];
        
        [moneyView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left);
            
            make.width.offset(ScreenW);
            
            make.top.equalTo(label.mas_bottom).offset(IphoneSize_Height(10));
            
            make.height.offset(IphoneSize_Height(50));
            
        }];

    }
    return self;
}

- (UIView *)setUpBankView{
    
    UIView * bankView = [[UIView alloc] init];
    
    bankView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:bankView];
    
    UIImageView * imageView = [[UIImageView alloc] init];
    
    imageView.image = [UIImage imageNamed:@"BankIcon"];
    
    [bankView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.offset(IphoneSize_Width(36));
        
        make.height.offset(IphoneSize_Height(36));
        
        make.left.equalTo(bankView.mas_left).offset(IphoneSize_Width(15));
        
        make.centerY.equalTo(bankView.mas_centerY);
        
    }];
    
    UILabel * bankLabel = [[UILabel alloc] init];
    
    bankLabel.text = @"招商银行";
    
    bankLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    
    bankLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    [bankView addSubview:bankLabel];

    [bankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(imageView.mas_right).offset(IphoneSize_Width(15));
        
        make.top.equalTo(imageView.mas_top);
        
    }];
    
    UILabel * noLabel = [[UILabel alloc] init];
    
    noLabel.text = @"尾号1256";
    
    noLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    
    noLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(13)];
    
    [bankView addSubview:noLabel];

    [noLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bankLabel.mas_left);
        
        make.top.equalTo(bankLabel.mas_bottom).offset(IphoneSize_Height(5));
        
    }];
    
    return bankView;
    
}

- (UIView *)setUpMoneyView{
    
    UIView * moneyView = [[UIView alloc] init];
    
    moneyView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:moneyView];
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = @"金额";
    
    label.textColor = [UIColor colorWithHexString:@"#333333"];
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    [moneyView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(moneyView.mas_left).offset(IphoneSize_Width(15));
        
        make.centerY.equalTo(moneyView.mas_centerY);
        
    }];
    
    UITextField * tf = [[UITextField alloc] init];
    
    tf.placeholder = @"5元起充，金元宝竞购100元起";
    
    tf.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    [moneyView addSubview:tf];
    
    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(label.mas_right).offset(IphoneSize_Width(23));
        
        make.centerY.equalTo(moneyView.mas_centerY);
    }];
    
    return moneyView;
}

@end
