//
//  MiddleMMoneyView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/4.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MiddleMMoneyView.h"

@implementation MiddleMMoneyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSString * btnStr[] = {@"safe",@"data",@"house"};
        
        NSString * labelStr[] = {@"安全保障",@"平台数据",@"企业简介"};

        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        
        self.layer.shadowOpacity =IphoneSize_Width(0.2f) ;
        
        self.layer.shadowRadius = IphoneSize_Width(4.f);
       
        self.layer.shadowOffset = CGSizeMake(IphoneSize_Width(1),IphoneSize_Height(1));
        
        self.layer.cornerRadius = IphoneSize_Width(5.0);
        
        for (int i = 0 ; i < 3; i ++) {
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [btn setImage:[UIImage imageNamed:btnStr[i]] forState:UIControlStateNormal];

            CGFloat wh = IphoneSize_Width(45);
            
            CGFloat min = (ScreenW - 3 * wh - IphoneSize_Width(20))/4;
            
            CGFloat topMin = IphoneSize_Height(23);

            [self addSubview:btn];
            
            __weak __typeof(&*self)ws = self;

            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.offset(wh);
                
                make.height.offset(wh);
                
                make.top.equalTo(ws.mas_top).offset(topMin);
                
                make.left.offset(min*(i + 1) + wh * i);
                
            }];
            
            UILabel *label = [[UILabel alloc] init];
            
            label.text = labelStr[i];
            
            label.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
            
            label.textColor = [UIColor colorWithHexString:@"#666666"];
            
            [self addSubview:label];
            
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.centerX.equalTo(btn.mas_centerX);
                
                make.top.equalTo(btn.mas_bottom).offset(IphoneSize_Height(16));
                
            }];
            
            switch (i) {
                    
                case 0:
                    self.safeBtn = btn;
                    break;
                case 1:
                    self.dataBtn = btn;
                    break;
                case 2:
                    self.introduceBtn = btn;
                    break;
                default:
                    break;
            }
        }
    }
    return self;
}

@end
