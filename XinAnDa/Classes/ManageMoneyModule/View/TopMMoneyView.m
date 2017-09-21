//
//  TopMMoneyView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/4.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "TopMMoneyView.h"

@implementation TopMMoneyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGround"]]];
        
        NSString * str =@"6.1+6.9%";

        UILabel * label = [[UILabel alloc] init];
        
        label.text = str;
        
        label.textColor = [UIColor whiteColor];
        
        label.font = [UIFont boldSystemFontOfSize:IphoneSize_Font(52)];
        
        NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:str];
        
        NSUInteger firstLoc = [[attributedString string] rangeOfString:@"+"].location;
        
        NSUInteger lastLoc = [[attributedString string] rangeOfString:@"%"].location + 1;
        
        NSRange range = NSMakeRange(firstLoc, lastLoc-firstLoc);
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:IphoneSize_Font(17)] range:range];
        
        [label setAttributedText:attributedString];
        
        [self addSubview:label];
        
        self.earnLabel = label;
        
        __weak __typeof(&*self)ws = self;

        [label mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.offset(ws.ZLHW/2);
            
            make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(70));
            
        }];
        
        UILabel * labelTwo = [[UILabel alloc] init];
        
        labelTwo.text = @"预期年化收益率";
        
        labelTwo.textColor = [UIColor whiteColor];
        
        labelTwo.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
        
        [self addSubview:labelTwo];
        
        [labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(label.mas_centerX);
            
            make.top.equalTo(label.mas_bottom);
            
        }];
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:@"去赚钱" forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor colorWithHexString:@"#fef739"] forState:UIControlStateNormal];
        
        CGFloat h =IphoneSize_Height(35);
        
        btn.layer.borderWidth =IphoneSize_Width(0.5);
        
        btn.layer.cornerRadius = h/2;
        
        btn.layer.borderColor= [UIColor colorWithHexString:@"#fef739"].CGColor;
        
        btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(16)];
        
        [self addSubview:btn];

        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(label.mas_centerX);
            
            make.top.equalTo(labelTwo.mas_bottom).offset(IphoneSize_Height(30));
            
            make.width.offset(IphoneSize_Width(150));
            
            make.height.offset(h);
            
        }];
        
        UILabel * labelThree = [[UILabel alloc] init];
        
        labelThree.text = @"收益稳健  •  存取便捷  •  信息透明  •  交易0费用";
        
        labelThree.textColor = [UIColor whiteColor];
        
        labelThree.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
        
        [self addSubview:labelThree];
        
        [labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(label.mas_centerX);
            
            make.top.equalTo(btn.mas_bottom).offset(IphoneSize_Height(48));
            
        }];

    }
    return self;
}

@end
