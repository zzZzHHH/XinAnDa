//
//  MainLogVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainLogVC.h"
#import "TextView.h"

@interface MainLogVC ()

@end

@implementation MainLogVC

- (void)viewDidLoad{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TPKeyboardAvoidingScrollView * tpKeyscrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.bounds];
    
    tpKeyscrollView.backgroundColor = [UIColor whiteColor];
    
    self.view = tpKeyscrollView;
    
    [self addUI];
}

- (void)addUI{
    
    __weak __typeof(&*self)ws = self;
    
    TextView * telNumView = [TextView textViewWithTitle:@"手机号" Placeholder:@"11位手机号"];
    
    self.telNumTF = telNumView.textField;
    
    [self.view addSubview:telNumView];
    
    TextView * testCodeView = [TextView textViewWithTitle:@"验证码" Placeholder:@"验证码"];
    
    self.testCodeTF = testCodeView.textField;
    
    [self.view addSubview:testCodeView];
    
    TextView * passWordView = [TextView textViewWithTitle:@"密码" Placeholder:@"6-16位数字或字母"];
    
    self.passWordTF = passWordView.textField;
    
    [self.view addSubview:passWordView];
    
    TextView * rePassWordView = [TextView textViewWithTitle:@"确认密码" Placeholder:@"6-16位数字或字母"];
    
    self.rePassWordTF = rePassWordView.textField;
    
    self.rePassWordView = rePassWordView;
    
    [self.view addSubview:rePassWordView];
    
    [telNumView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(IphoneSize_Height(17));
        
        make.left.equalTo(ws.view.mas_right).offset(IphoneSize_Width(25));
        
        make.width.offset(ScreenW - IphoneSize_Width(50));
        
        make.height.offset(IphoneSize_Height(47));
    }];
    
    [testCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(telNumView.mas_bottom).offset(IphoneSize_Height(20));
        
        make.left.equalTo(ws.view.mas_right).offset(IphoneSize_Width(25));
        
        make.width.offset(ScreenW - IphoneSize_Width(50));
        
        make.height.offset(IphoneSize_Height(47));
    }];
    
    [passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(testCodeView.mas_bottom).offset(IphoneSize_Height(20));
        
        make.left.equalTo(ws.view.mas_right).offset(IphoneSize_Width(25));
        
        make.width.offset(ScreenW - IphoneSize_Width(50));
        
        make.height.offset(IphoneSize_Height(47));
    }];
    
    [rePassWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(passWordView.mas_bottom).offset(IphoneSize_Height(20));
        
        make.left.equalTo(ws.view.mas_right).offset(IphoneSize_Width(25));
        
        make.width.offset(ScreenW - IphoneSize_Width(50));
        
        make.height.offset(IphoneSize_Height(47));
    }];
    
    UIButton * goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    goBtn.backgroundColor = [UIColor colorWithHexString:@"#1e78ff" alpha:1.0];
    
    goBtn.layer.cornerRadius = IphoneSize_Width(5.0);
    
    goBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];

    [goBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [goBtn setTitle:self.btnTitle forState:UIControlStateNormal];
    
    self.goBtn = goBtn;
    
    [self.view addSubview:goBtn];
    
    [goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(44));
        
        make.left.equalTo(passWordView.mas_left);
        
        make.right.equalTo(passWordView.mas_right);
        
        make.top.equalTo(rePassWordView.mas_bottom).offset(IphoneSize_Height(95));
    }];
    
    UIButton * getCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    getCodeBtn.layer.cornerRadius = IphoneSize_Width(3.0);
    
    getCodeBtn.layer.borderWidth= IphoneSize_Width(0.8);
    
    getCodeBtn.layer.borderColor = [UIColor colorWithHexString:@"#ff7979"].CGColor;
    
    [getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    [getCodeBtn setTitleColor:[UIColor colorWithHexString:@"#ff7979"] forState:UIControlStateNormal];
    
    getCodeBtn.titleLabel.font = [UIFont systemFontOfSize: IphoneSize_Font(13)];
    
    [testCodeView addSubview:getCodeBtn];
    
    [getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(28));
        
        make.width.offset(IphoneSize_Width(75));
        
        make.right.equalTo(testCodeView.mas_right);
        
        make.bottom.equalTo(testCodeView.mas_bottom).offset(IphoneSize_Height(-8));
    }];
    
    self.getCodeBtn = getCodeBtn;
}

@end
