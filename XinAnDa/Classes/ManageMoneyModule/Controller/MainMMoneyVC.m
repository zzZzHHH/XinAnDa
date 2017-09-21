//
//  MainMMoneyVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/4.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainMMoneyVC.h"
#import "TopMMoneyView.h"
#import "MiddleMMoneyView.h"
#import "SafeMMoneyVC.h"
#import "JinYuanBaoMMoneyVC.h"

@interface MainMMoneyVC ()

@end

@implementation MainMMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    [self setNavItem];
    
    [self addUI];
}

- (void)addUI{
    
    TopMMoneyView * topMMoneyView = [[TopMMoneyView alloc] init];
    
    [self.view addSubview:topMMoneyView];
    
    __weak __typeof(&*self)ws = self;
    
    [topMMoneyView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.top.equalTo(ws.view.mas_top);
        
        make.height.offset(IphoneSize_Height(410));
    }];
    
    MiddleMMoneyView * middleMMoneyView = [[MiddleMMoneyView alloc] init];

    [middleMMoneyView.safeBtn addTarget:self action:@selector(safeBtnClick) forControlEvents:UIControlEventTouchDown];
    
    [middleMMoneyView.dataBtn addTarget:self action:@selector(dataBtnClick) forControlEvents:UIControlEventTouchDown];
    
    [middleMMoneyView.introduceBtn addTarget:self action:@selector(introduceBtnClick) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:middleMMoneyView];
    
    [middleMMoneyView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(130));
        
        make.left.equalTo(ws.view.mas_left).offset(IphoneSize_Width(10));
        
        make.width.offset(ScreenW - IphoneSize_Width(20));
        
        make.top.equalTo(ws.view.mas_top).offset(IphoneSize_Height(360));
        
    }];
    
    UILabel * bottomLabel = [[UILabel alloc] init];
    
    bottomLabel.text = @"账户资金由浦发支付托管";
    
    bottomLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    bottomLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    
    [self.view addSubview:bottomLabel];
    
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(middleMMoneyView.mas_centerX);
        
        make.top.equalTo(middleMMoneyView.mas_bottom).offset(IphoneSize_Height(20));
        
    }];
}

- (void)setNavItem{
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightBtn setImage:[UIImage imageNamed:@"Message"] forState:UIControlStateNormal];
    
    rightBtn.ZLHW = IphoneSize_Width(21);
    
    rightBtn.ZLHH = IphoneSize_Height(21);
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    UIButton * leftButton = [[UIButton alloc] init];
    
    [leftButton setTitle:@"金元宝投资" forState:UIControlStateNormal];
    
    leftButton.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [leftButton sizeToFit];
    
    [leftButton addTarget:self action:@selector(rightNavClick) forControlEvents:UIControlEventTouchDown];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
}

- (void)rightNavClick{
    
    JinYuanBaoMMoneyVC * jinYuanBaoMMoneyVC = [[JinYuanBaoMMoneyVC alloc] init];
    
    [self.navigationController pushViewController:jinYuanBaoMMoneyVC animated:YES];
}

- (void)safeBtnClick{
    
    SafeMMoneyVC * safeMMoneyVC = [[SafeMMoneyVC alloc] init];
    
    [self.navigationController pushViewController:safeMMoneyVC animated:YES];
}

- (void)dataBtnClick{
    
    NSLog(@"数据");

}

- (void)introduceBtnClick{
    
    NSLog(@"企业简介");

}
@end
