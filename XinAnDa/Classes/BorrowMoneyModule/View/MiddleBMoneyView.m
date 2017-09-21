//
//  MiddleBMoneyView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/4.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MiddleBMoneyView.h"

@implementation MiddleBMoneyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        __weak __typeof(&*self)ws = self;

        UIView * viewOne = [self setUpViewWithTextOne:@"21552.85亿元" TextTwo:@"累计成交金额" Image:@"RMB"];
        
        [self addSubview:viewOne];
        
        UIView * viewTwo = [self setUpViewWithTextOne:@"419.92用户" TextTwo:@"累计交易用户" Image:@"Group"];
        
        [self addSubview:viewTwo];
        
        [viewOne mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left);
            
            make.height.equalTo(ws.mas_height);
            
            make.width.equalTo(ws.mas_width).dividedBy(2);
            
            make.top.equalTo(ws.mas_top);
            
        }];
        
        [viewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(viewOne.mas_right);

            make.height.equalTo(ws.mas_height);
            
            make.width.equalTo(ws.mas_width).dividedBy(2);
            
            make.top.equalTo(ws.mas_top);
        }];
    }
    return self;
}

- (UIView *) setUpViewWithTextOne:(NSString *)textOne TextTwo:(NSString *)textTwo Image:(NSString *)image{
    
    UIView * view = [[UIView alloc] init];

    UIImageView * imageView = [[UIImageView alloc] init];
    
    imageView.image = [UIImage imageNamed:image];
    
    [view addSubview:imageView];
    
    CGFloat imageViewWH = IphoneSize_Width(26);
    
    CGFloat min = IphoneSize_Width(28);
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(imageViewWH);
        
        make.height.offset(imageViewWH);
        
        make.left.equalTo(view.mas_left).offset(min);
        
        make.top.equalTo(view.mas_top).offset(IphoneSize_Height(15));
        
    }];
    
    UILabel * labelOne = [[UILabel alloc] init];
    
    labelOne.text = textOne;
    
    labelOne.textColor = [UIColor colorWithHexString:@"#1e78ff"];
    
    labelOne.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    [view addSubview:labelOne];
    
    [labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(imageView.mas_top).offset(IphoneSize_Height(-2));
        
        make.left.equalTo(imageView.mas_right).offset(IphoneSize_Width(8));
        
    }];
    
    UILabel * labelTwo = [[UILabel alloc] init];
    
    labelTwo.text = textTwo;
    
    labelTwo.textColor = [UIColor colorWithHexString:@"#999999"];
    
    labelTwo.font = [UIFont systemFontOfSize:IphoneSize_Font(12)];
    
    [view addSubview:labelTwo];
    
    [labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(labelOne.mas_bottom).offset(IphoneSize_Height(2));
        
        make.left.equalTo(labelOne.mas_left);
        
    }];

    return view;
}

@end
