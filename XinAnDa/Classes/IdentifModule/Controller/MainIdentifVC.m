//
//  MainIdentifVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainIdentifVC.h"
#import "TopView.h"
#import "MiddleView.h"

@interface MainIdentifVC ()

@end

@implementation MainIdentifVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"身份认证";
    
    TPKeyboardAvoidingScrollView * tpKeyscrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.bounds];
    
    tpKeyscrollView.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    self.view = tpKeyscrollView;
    
    [self addUI];
}

- (void)addUI{
    
    TopView * topView = [[TopView alloc] init];
    
    topView.intLineArray = self.intLineArray;
    
    topView.intImageArray = self.intImageArray;
    
    [self.view addSubview:topView];
    
    __weak __typeof(&*self)ws = self;
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.height.offset(IphoneSize_Height(62));
        
        make.top.equalTo(ws.view.mas_top).offset(IphoneSize_Height(30));
        
    }];
    
    MiddleView * middleView = [[MiddleView alloc] init];
    
    self.labelArray = middleView.labelArray;
    
    self.middleView = middleView;
    
    [self.view addSubview:middleView];
    
    [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(topView.mas_bottom).offset(IphoneSize_Height(52));
        
        make.height.offset(IphoneSize_Height(100));
        
        make.left.equalTo(topView.mas_left);
        
        make.right.equalTo(topView.mas_right);
        
    }];
    
    UIButton * goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    goBtn.backgroundColor = [UIColor colorWithHexString:@"#1e78ff" alpha:1.0];
    
    goBtn.layer.cornerRadius = IphoneSize_Width(5.0);
    
    goBtn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(17)];

    [goBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [goBtn setTitle:@"下一步" forState:UIControlStateNormal];
    
    self.goBtn = goBtn;
    
    [self.view addSubview:goBtn];
    
    [goBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(44));
        
        make.left.equalTo(middleView.mas_left).offset(IphoneSize_Width(30));
        
        make.right.equalTo(middleView.mas_right).offset(IphoneSize_Width(-30));
        
        make.top.equalTo(middleView.mas_bottom).offset(IphoneSize_Height(110));
    }];
}


@end
