//
//  LogInVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/6/30.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "LogInVC.h"
#import "TextView.h"
#import "SignInVC.h"
#import "ForgetPassWordVC.h"
#import "NameIdentifVC.h"

@interface LogInVC ()

@property (nonatomic,weak)TextView *telNumView;

@property (nonatomic,weak)TextView *passWordView;

@end

@implementation LogInVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"登录";

    TPKeyboardAvoidingScrollView * tpKeyscrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.bounds];
    
    tpKeyscrollView.backgroundColor = [UIColor whiteColor];
    
    self.view = tpKeyscrollView;
    
    //设置rightNavItem
    [self setUpRightNavItem];
    
    //添加控件
    [self addUI];
}

#pragma 添加UI
- (void)addUI{
    
    TextView * telNumView = [TextView textViewWithTitle:@"手机号"];
    
    self.telNumView = telNumView;
    
    [self.view addSubview:telNumView];
    
    TextView * passWordView = [TextView textViewWithTitle:@"登录密码"];
    
    self.passWordView = passWordView;
    
    [self.view addSubview:passWordView];
    
    __weak __typeof(&*self)ws = self;
    
    [telNumView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.view.mas_left).offset(IphoneSize_Width(27));
        
        make.top.equalTo(ws.view.mas_top).offset(IphoneSize_Height(174));
        
        make.width.offset(ScreenW - IphoneSize_Width(54));
        
        make.height.offset(IphoneSize_Height(42));
    }];
    
    [passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.equalTo(telNumView.mas_width);
        
        make.height.equalTo(telNumView.mas_height);
        
        make.centerX.equalTo(telNumView.mas_centerX);
        
        make.top.equalTo(telNumView.mas_bottom).offset(IphoneSize_Height(15));
    }];
    
    UIButton * forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    
    [forgetBtn setTitleColor:[UIColor colorWithHexString:@"#1e78ff" alpha:1.0] forState:UIControlStateNormal];
    
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    [forgetBtn sizeToFit];
    
    [forgetBtn addTarget:self action:@selector(forgetPassWordClick) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:forgetBtn];
    
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(passWordView.mas_right);
        
        make.top.equalTo(passWordView.mas_bottom).offset(IphoneSize_Height(6));
    }];
    
    UIButton * logInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    logInBtn.backgroundColor = [UIColor colorWithHexString:@"#1e78ff" alpha:1.0];
    
    logInBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];
    
    logInBtn.layer.cornerRadius = IphoneSize_Width(5.0);
    
    [logInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [logInBtn setTitle:@"登录" forState:UIControlStateNormal];
    
    [logInBtn addTarget:self action:@selector(logInClick) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:logInBtn];
    
    [logInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(44));
        
        make.left.equalTo(passWordView.mas_left);
        
        make.right.equalTo(passWordView.mas_right);
        
        make.bottom.equalTo(forgetBtn.mas_bottom).offset(IphoneSize_Height(95));
    }];
    
}

#pragma 设置右侧Nav
- (void)setUpRightNavItem {
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];

    [btn setTitle:@"注册" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(16) weight:IphoneSize_Width(2)];
    
    //尺寸自适应
    [btn sizeToFit];
    
    [btn addTarget:self action:@selector(pushSignInVC) forControlEvents:UIControlEventTouchDown];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

#pragma 跳转注册界面
- (void)pushSignInVC{

    SignInVC * signInVC = [[SignInVC alloc] init];
    
    [self.navigationController pushViewController:signInVC animated:true];
}

#pragma 跳转忘记密码页面
- (void)forgetPassWordClick{
    
    ForgetPassWordVC * forgetPassWordVC = [[ForgetPassWordVC alloc] init];
    
    [self.navigationController pushViewController:forgetPassWordVC animated:true];
    
}

#pragma 跳转登录页面
- (void)logInClick{
    
    NSLog(@"%@",self.telNumView.textField.text);
    
    NSLog(@"%@",self.passWordView.textField.text);
    
    NameIdentifVC * vc = [[NameIdentifVC alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
