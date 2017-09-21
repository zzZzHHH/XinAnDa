//
//  OutMoneyCollectionCell.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/6.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "OutMoneyCollectionCell.h"

@implementation OutMoneyCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGround"]]];
        
        self.layer.cornerRadius = IphoneSize_Width(5.0);
        
        UIImageView * bankImageView = [[UIImageView alloc] init];
        
        bankImageView.image = [UIImage imageNamed:@"BankIconWithe"];
        
        [self addSubview:bankImageView];
        
        __weak __typeof(&*self)ws = self;
        
        CGFloat wh = IphoneSize_Width(40);
        
        CGFloat min = IphoneSize_Width(20);
        
        [bankImageView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.offset(wh);
            
            make.height.offset(wh);
            
            make.left.equalTo(ws.mas_left).offset(min);
            
            make.top.equalTo(ws.mas_top).offset(min);
            
        }];
        
        UILabel * bankLabel = [[UILabel alloc] init];
        
        bankLabel.text = @"招商银行";
        
        bankLabel.textColor = [UIColor whiteColor];
        
        bankLabel.font = [UIFont boldSystemFontOfSize:IphoneSize_Font(19)];
        
        [self addSubview:bankLabel];
        
        [bankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(bankImageView.mas_right).offset(IphoneSize_Width(15));
            
            make.centerY.equalTo(bankImageView.mas_centerY);
        }];
        
        UILabel * numLabel = [[UILabel alloc] init];
        
        numLabel.text = @"****  ****  ****  6689";
        
        numLabel.textAlignment = NSTextAlignmentCenter;
        
        numLabel.textColor = [UIColor whiteColor];
        
        numLabel.font = [UIFont boldSystemFontOfSize:IphoneSize_Font(21)];
        
        [self addSubview:numLabel];
        
        [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(33));
            
            make.top.equalTo(bankImageView.mas_bottom).offset(IphoneSize_Height(31));
            
            make.right.equalTo(ws.mas_right).offset(IphoneSize_Width(-33));
        }];
    }
    
    return self;
}
@end
