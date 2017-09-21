//
//  ChangeCardVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/7.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "ChangeCardVC.h"
#import "MiddleView.h"

@interface ChangeCardVC ()

@end

@implementation ChangeCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"银行卡";
    
    TPKeyboardAvoidingScrollView * tpKeyscrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.bounds];
    
    tpKeyscrollView.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    self.view = tpKeyscrollView;
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    [self addUI];
}

- (void)addUI{

    MiddleView * middleView = [[MiddleView alloc] init];
    
    middleView.tfOne.placeholder = @"请输入本人储蓄卡";
    
    middleView.tfTwo.placeholder = @"请输入银行柜面预留手机号";
    
    middleView.label.text = nil;

    [self.view addSubview:middleView];
    
    __weak __typeof(&*self)ws = self;

    [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(ws.view.mas_top).offset(IphoneSize_Height(10));
        
        make.height.offset(IphoneSize_Height(100));
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
    }];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:@"Camera"] forState:UIControlStateNormal];
    
    [middleView.tfOne addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(IphoneSize_Width(23));
        
        make.height.offset(IphoneSize_Height(23));
        
        make.right.equalTo(middleView.tfOne.mas_right);
        
        make.centerY.offset(middleView.tfOne.ZLHH/2);
    }];
    
    UIButton * goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    goBtn.backgroundColor = [UIColor colorWithHexString:@"#1e78ff" alpha:1.0];
    
    goBtn.layer.cornerRadius = IphoneSize_Width(5.0);
    
    goBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];
    
    [goBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [goBtn setTitle:@"更换银行卡" forState:UIControlStateNormal];
    
    [self.view addSubview:goBtn];
    
    [goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(44));
        
        make.left.equalTo(ws.view.mas_left).offset(IphoneSize_Width(27));
        
        make.right.offset(ScreenW - IphoneSize_Width(27));
        
        make.top.equalTo(middleView.mas_bottom).offset(IphoneSize_Height(390));
    }];
}


@end
