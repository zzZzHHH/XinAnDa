//
//  CardIdentifVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "CardIdentifVC.h"
#import "PassWordIdentifVC.h"
@interface CardIdentifVC ()

@end

@implementation CardIdentifVC

- (void)viewDidLoad{
    
    self.intImageArray = @[@1,@1,@0];
    
    self.intLineArray = @[@1,@0];
    
    [super viewDidLoad];
    
    [self addSubUI];
    
    [self.goBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchDown];
}

-(void)addSubUI{
    
    [self.labelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString * tfArray[] = {@"请输入本人储蓄卡",@"请输入银行柜面余留手机号"};
        
        UITextField * tf = self.labelArray[idx];
        
        tf.placeholder= tfArray[idx];
        
        if (idx == 0) {
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [btn setImage:[UIImage imageNamed:@"Camera"] forState:UIControlStateNormal];
            
            [tf addSubview:btn];
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.offset(IphoneSize_Width(23));
                
                make.height.offset(IphoneSize_Height(23));
                
                make.right.equalTo(tf.mas_right);
                
                make.centerY.offset(tf.ZLHH/2);
            }];
        }
    }];
    
    UIButton * bankBtn = [self setUpBtnWithTitle:@"支持银行"];
    
    [bankBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.goBtn.mas_bottom).offset(IphoneSize_Height(25));
        
        make.centerX.equalTo(self.goBtn.mas_centerX);
        
    }];
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = @"点击“下一步”表示您同意";
    
    label.textColor = [UIColor colorWithHexString:@"#666666"];
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(bankBtn.mas_bottom).offset(IphoneSize_Height(50));
        
        make.centerX.equalTo(self.goBtn.mas_centerX);
        
    }];
    
    UIButton * btnOne = [self setUpBtnWithTitle:@"《存钱罐服务协议》"];
    UIButton * btnTwo = [self setUpBtnWithTitle:@"《快捷支付协议》"];
    UIButton * btnThree = [self setUpBtnWithTitle:@"《增值服务协议》"];
    
    [btnOne mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(label.mas_centerX);
        make.top.equalTo(label.mas_bottom);
    }];
    
    [btnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(label.mas_centerX);
        make.top.equalTo(label.mas_bottom);
    }];
    
    [btnThree mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(label.mas_centerX);
        make.top.equalTo(btnTwo.mas_bottom);
    }];
    
}

- (UIButton *)setUpBtnWithTitle:(NSString *)title{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor colorWithHexString:@"#1e78ff"] forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    [self.view addSubview:btn];

    return btn;
}

- (void)nextStep{
    
    PassWordIdentifVC * passWordIdentifVC = [[PassWordIdentifVC alloc] init];
    
    [self.navigationController pushViewController:passWordIdentifVC animated:YES];
}

@end
