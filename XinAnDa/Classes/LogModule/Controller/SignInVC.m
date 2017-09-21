//
//  SignInVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/6/30.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SignInVC.h"
#import "SignProtocolView.h"

@implementation SignInVC

- (void)viewDidLoad {
    
    self.btnTitle = @"注册";
    
    [super viewDidLoad];

    self.title = @"注册";
    
    [self.goBtn addTarget:self action:@selector(signInClick) forControlEvents:UIControlEventTouchDown];
    
    [self addSubUI];
    
   }

#pragma 添加UI视图
- (void)addSubUI {
    
    __weak __typeof(&*self)ws = self;
    
    SignProtocolView * signProtocolView = [[SignProtocolView alloc] init];
    
    [signProtocolView.protocolBtn addTarget:self action:@selector(protocolClick) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:signProtocolView];
    
    [signProtocolView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.rePassWordView.mas_left);
        
        make.height.offset(IphoneSize_Height(20));
        
        make.width.offset(IphoneSize_Width(200));
        
        make.top.equalTo(ws.rePassWordView.mas_bottom).offset(IphoneSize_Height(20));
    }];
}

#pragma 跳转注册协议界面
- (void)protocolClick {
    
    UIViewController * vc = [[UIViewController alloc] init];
    
    vc.title = @"注册协议";
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:vc animated:true];
    
}
#pragma 注册按钮点击
- (void)signInClick {
    
    NSLog(@"%@-%@-%@-%@",self.telNumTF.text,self.testCodeTF.text,self.passWordTF.text,self.rePassWordTF.text);
}

@end
