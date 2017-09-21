//
//  MainBMoneyVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/4.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainBMoneyVC.h"
#import "TopBMoneyView.h"
#import "MiddleBMoneyView.h"
@interface MainBMoneyVC ()

@end

@implementation MainBMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    self.navigationItem.title = @"信安达幸福贷";
    
    [self setNavBar];
    
    [self addUI];
}

- (void)addUI{
    
    TopBMoneyView * topBMoneyView = [[TopBMoneyView alloc] init];
    
    [self.view addSubview:topBMoneyView];
    
    __weak __typeof(&*self)ws = self;
    
    [topBMoneyView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.top.equalTo(ws.view.mas_top);
        
        make.height.offset(IphoneSize_Height(317));
    }];
    
    UILabel *label = [[UILabel alloc] init];
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(13)];
    
    label.textColor = [UIColor colorWithHexString:@"#999999"];
    
    label.text = @"您离获得信用额度还差一点点";
    
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(topBMoneyView.mas_centerX);
        
        make.top.equalTo(topBMoneyView.mas_bottom).offset(IphoneSize_Height(12));
        
    }];

    UIButton * btn = [[UIButton alloc] init];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(13)];
    
    [btn setTitle:@"如何测完信用额度？" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor colorWithHexString:@"#1e78ff"] forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(label.mas_centerX);
        
        make.top.equalTo(label.mas_bottom).offset(IphoneSize_Height(2));
        
    }];
    
    UIButton * rightAwayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightAwayBtn.backgroundColor = [UIColor colorWithHexString:@"#1e78ff" alpha:1.0];
    
    rightAwayBtn.layer.cornerRadius = IphoneSize_Width(5.0);
    
    [rightAwayBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    rightAwayBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];
    
    [rightAwayBtn setTitle:@"马上借钱" forState:UIControlStateNormal];
    
    [self.view addSubview:rightAwayBtn];
    
    [rightAwayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(44));
        
        make.left.equalTo(self.view.mas_left).offset(IphoneSize_Width(27));
        
        make.width.offset(ScreenW - IphoneSize_Width(54));
        
        make.top.equalTo(btn.mas_bottom).offset(IphoneSize_Height(55));
    }];
    
    MiddleBMoneyView * middleBMoneyView = [[MiddleBMoneyView alloc] init];
    
    middleBMoneyView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:middleBMoneyView];
    
    [middleBMoneyView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view.mas_left);

        make.width.offset(ScreenW);
        
        make.height.offset(IphoneSize_Height(60));
        
        make.top.equalTo(rightAwayBtn.mas_bottom).offset(IphoneSize_Height(50));
    }];
    
    UILabel * bottomLabel = [[UILabel alloc] init];
    
    bottomLabel.text = @"账户资金由浦发支付托管";
    
    bottomLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(13)];
    
    bottomLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    
    [self.view addSubview:bottomLabel];
    
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(middleBMoneyView.mas_centerX);
        
        make.top.equalTo(middleBMoneyView.mas_bottom).offset(IphoneSize_Height(6));
        
    }];
    
}

- (void)setNavBar{
    
    UILabel * rightLabel = [[UILabel alloc] init];
    
    rightLabel.text = @"我的借款";
    
    rightLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    rightLabel.textColor = [UIColor whiteColor];
    
    [rightLabel sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightLabel];
}

@end
