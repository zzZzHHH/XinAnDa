//
//  MakeDateOutMoneyVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MakeDateOutMoneyVC.h"
#import "MakeMoneyTopView.h"
#import "MakeMoneyCenterView.h"
#import "MakeMoneyBottomView.h"

@interface MakeDateOutMoneyVC ()

@end

@implementation MakeDateOutMoneyVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    self.title = @"3个月定期投资";
    
    [self addUI];
}

- (void)addUI{
    
    MakeMoneyTopView * makeMoneyTopView=[[MakeMoneyTopView alloc] init];
    [self.view addSubview:makeMoneyTopView];
    
    MakeMoneyCenterView * makeMoneyCenterView=[[MakeMoneyCenterView alloc]init];
    [self.view addSubview:makeMoneyCenterView];
    
    MakeMoneyBottomView * makeMoneyBottomView=[[MakeMoneyBottomView alloc] init];
    [self.view addSubview:makeMoneyBottomView];
    
    __weak __typeof(&*self)ws = self;

    [makeMoneyTopView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(ws.view.mas_top);
        
        make.left.equalTo(ws.view.mas_left);
        
        make.right.equalTo(ws.view.mas_right);
        
        make.height.offset(IphoneSize_Height(294));
    }];
    
    [makeMoneyCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(makeMoneyTopView.mas_bottom).offset(10);
        
        make.left.equalTo(ws.view.mas_left);
        
        make.right.equalTo(ws.view.mas_right);
        
        make.height.offset(IphoneSize_Height(91));
    }];
    
    [makeMoneyBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(makeMoneyCenterView.mas_bottom).offset(10);
        
        make.left.equalTo(ws.view.mas_left);
        
        make.right.equalTo(ws.view.mas_right);
        
        make.height.offset(IphoneSize_Height(150));
    }];
    
    UIButton * logInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    logInBtn.backgroundColor = [UIColor colorWithHexString:@"#1e78ff" alpha:1.0];
    
    logInBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];
    
    logInBtn.layer.cornerRadius = IphoneSize_Width(5.0);
    
    [logInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [logInBtn setTitle:@"立即投资" forState:UIControlStateNormal];
    
    [self.view addSubview:logInBtn];
    
    [logInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(44));
        
        make.left.equalTo(ws.view.mas_left).offset(IphoneSize_Width(27));
        
        make.right.equalTo(ws.view.mas_right).offset(IphoneSize_Width(-27));
        
        make.bottom.equalTo(ws.view.mas_bottom).offset(IphoneSize_Height(-30));
    }];

}

@end
