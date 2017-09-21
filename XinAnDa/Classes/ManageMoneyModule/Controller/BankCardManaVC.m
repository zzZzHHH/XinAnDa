//
//  BankCardManaVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/7.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "BankCardManaVC.h"
#import "BankCardView.h"
#import "ChangeCardVC.h"

@interface BankCardManaVC ()

@end

@implementation BankCardManaVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];

    self.title = @"充值银行卡管理";
    
    [self addUI];
}

- (void)addUI{
    
    UILabel * topLabel = [[UILabel alloc] init];
    
    topLabel.text = @"当前充值银行卡";
    
    topLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    
    topLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    [self.view addSubview:topLabel];
    
    __weak __typeof(&*self)ws = self;

    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(ws.view.mas_centerX);
        
        make.top.equalTo(ws.view.mas_top).offset(IphoneSize_Height(30)+TabBarH);
    }];
    
    BankCardView * bankCardView = [[BankCardView alloc] init];
    
    [bankCardView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGround"]]];
    
    [self.view addSubview:bankCardView];
    
    CGFloat w = IphoneSize_Width(290);
    
    CGFloat h = IphoneSize_Height(160);
    
    [bankCardView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.offset(w);
        
        make.height.offset(h);
        
        make.left.equalTo(ws.view.mas_left).offset((ScreenW - w)/2);
        
        make.top.equalTo(topLabel.mas_bottom).offset(30);
        
    }];
    
    UIButton * goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    goBtn.backgroundColor = [UIColor colorWithHexString:@"#1e78ff" alpha:1.0];
    
    goBtn.layer.cornerRadius = IphoneSize_Width(5.0);
    
    goBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];
    
    [goBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [goBtn setTitle:@"更换银行卡" forState:UIControlStateNormal];
    
    [goBtn addTarget:self action:@selector(GoClick) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:goBtn];
    
    [goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(44));
        
        make.left.equalTo(ws.view.mas_left).offset(IphoneSize_Width(27));
        
        make.right.equalTo(ws.view.mas_right).offset(IphoneSize_Width(-27));
        
        make.top.equalTo(bankCardView.mas_bottom).offset(IphoneSize_Height(265));
    }];

}

- (void)GoClick{
    
    ChangeCardVC * changeCardVC = [[ChangeCardVC alloc] init];
    
    [self.navigationController pushViewController:changeCardVC animated:YES];
}

@end
