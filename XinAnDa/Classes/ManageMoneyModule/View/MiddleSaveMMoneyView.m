//
//  MiddleSaveMMoneyView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/6.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MiddleSaveMMoneyView.h"


@interface MiddleSaveMMoneyView()

@property (nonatomic,weak)UIView *lineOne;

@property (nonatomic,weak)UIView *lineTwo;

@property (nonatomic,weak)UILabel *circleLabelOne;

@property (nonatomic,weak)UILabel *circleLabelTwo;

@end

@implementation MiddleSaveMMoneyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
                
        UIButton * logInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        logInBtn.backgroundColor = [UIColor colorWithHexString:@"#1e78ff" alpha:1.0];
        
        logInBtn.layer.cornerRadius = IphoneSize_Width(5.0);
        
        logInBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];
        
        [logInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [logInBtn setTitle:@"确定" forState:UIControlStateNormal];
        
        [self addSubview:logInBtn];
        
        __weak __typeof(&*self)ws = self;

        [logInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.height.offset(IphoneSize_Height(44));
            
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(27));
            
            make.right.equalTo(ws.mas_right).offset(IphoneSize_Width(-27));
            
            make.top.equalTo(ws.mas_top);
        }];

        UILabel * label = [[UILabel alloc] init];
        
        label.text = @"点击“充值”按钮，即表示你同意";
        
        label.font = [UIFont systemFontOfSize:IphoneSize_Font(13)];
        
        label.textColor = [UIColor colorWithHexString:@"#999999"];
        
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(logInBtn.mas_centerX);
            
            make.top.equalTo(logInBtn.mas_bottom).offset(IphoneSize_Height(10));
            
        }];
        
        UIButton * btnOne = [self setUpBtnWithTitle:@"《投资服务协议》"];
        UIButton * btnTwo = [self setUpBtnWithTitle:@"《增值服务协议》"];
        
        [btnOne mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(label.mas_centerX);
            make.top.equalTo(label.mas_bottom);
        }];
        
        [btnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(label.mas_centerX);
            make.top.equalTo(label.mas_bottom);
        }];
        
        UIView * circleView = [self setUpCircleView];
        
        [circleView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left);
            
            make.width.offset(ScreenW);
            
            make.top.equalTo(btnTwo.mas_bottom).offset(IphoneSize_Height(45));
            
            make.height.offset(IphoneSize_Height(62));
        }];
        
        UILabel * bottomLabelOne = [self setUpLabelWithTitle:@"100%"];
        UILabel * bottomLabelTwo = [self setUpLabelWithTitle:@"七日年化3.84%"];
        UILabel * bottomLabelThree = [self setUpLabelWithTitle:@"自动竞购"];
        UILabel * bottomLabelFour = [self setUpLabelWithTitle:@"年化6.1%"];
        
        [bottomLabelOne mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.lineOne.mas_centerX);
            
            make.bottom.equalTo(self.lineOne.mas_top).offset(IphoneSize_Height(-8));
        }];
        [bottomLabelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.circleLabelOne.mas_centerX);
            
            make.top.equalTo(self.circleLabelOne.mas_bottom).offset(IphoneSize_Height(8));
        }];
        [bottomLabelThree mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.lineTwo.mas_centerX);
            
            make.bottom.equalTo(self.lineTwo.mas_top).offset(IphoneSize_Height(-8));
        }];
        [bottomLabelFour mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.circleLabelTwo.mas_centerX);
            
            make.top.equalTo(self.circleLabelTwo.mas_bottom).offset(IphoneSize_Height(8));
        }];
        
        UIButton * answerBtn = [self setUpBtnWithTitle:@"常见问题?"];
        
        [answerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(ws.mas_centerX);
            
            make.bottom.equalTo(ws.mas_bottom).offset(IphoneSize_Height(-10));

        }];
    }
    return self;
}

- (UILabel *)setUpLabelWithTitle:(NSString *)title{
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = title;
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    label.textColor = [UIColor colorWithHexString:@"#666666"];
    
    [self addSubview:label];
    
    return label;
}

- (UIButton *)setUpBtnWithTitle:(NSString *)title{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor colorWithHexString:@"#1e78ff"] forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(13)];
    
    [self addSubview:btn];
    
    return btn;
}

- (UIView *)setUpCircleView {
    
    UIView * circleView = [[UIView alloc] init];
    
    [self addSubview:circleView];
    
    NSString * str[] = {@"充值",@"存钱罐",@"金元宝"};
    
    for (int i = 0 ; i < 3; i ++) {
        
        UILabel * label = [[UILabel alloc] init];
        
        switch (i) {
            case 0:
                label.layer.borderColor = [UIColor colorWithHexString:@"1e78ff"].CGColor;
                break;
            case 1:
                self.circleLabelOne = label;
            case 2:
                self.circleLabelTwo = label;
            default:
                label.layer.borderColor = [UIColor colorWithHexString:@"e8f1ff"].CGColor;
                break;
        }
        
        CGFloat w = IphoneSize_Width(62);
        
        label.layer.cornerRadius = w/2;
        
        label.layer.borderWidth = IphoneSize_Width(2.0);
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.clipsToBounds = YES;
        
        label.text = str[i];
        
        label.textColor = [UIColor colorWithHexString:@"#333333"];
        
        label.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
        
        label.backgroundColor = [UIColor whiteColor];
        
        [circleView addSubview:label];
                
        CGFloat min = (ScreenW - 3 * w)/6;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.offset(w);
            
            make.height.offset(w);
            
            make.left.equalTo(circleView.mas_left).offset(min*(2*i + 1) + w * i);
            
            make.bottom.equalTo(circleView.mas_bottom);
            
        }];
        
        if (i < 2) {
            
            UIView * view = [[UIView alloc] init];
            switch (i) {
                case 0:
                    view.backgroundColor = [UIColor colorWithHexString:@"1e78ff"];
                    self.lineOne = view;
                    break;
                case 1:
                    view.backgroundColor = [UIColor colorWithHexString:@"e8f1ff"];
                    self.lineTwo = view;
                    break;
                default:
                    break;
            }
            [circleView addSubview:view];
            
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.offset(min * 2);
                
                make.height.offset(IphoneSize_Height(2));
                
                make.left.equalTo(label.mas_right);
                
                make.centerY.equalTo(label.mas_centerY);
                
            }];
        }
    }
    
    return circleView;
}
@end
