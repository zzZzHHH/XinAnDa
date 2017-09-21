//
//  SaveMMoneyVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/6.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SaveMMoneyVC.h"
#import "TopSaveMMoneyView.h"
#import "MiddleSaveMMoneyView.h"
#import "SaveRecordVC.h"

@interface SaveMMoneyVC ()

@end

@implementation SaveMMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充值";
    
    TPKeyboardAvoidingScrollView * tpKeyscrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.bounds];
    
    tpKeyscrollView.showsVerticalScrollIndicator = NO;
    
    tpKeyscrollView.backgroundColor = [UIColor whiteColor];
    
    self.view = tpKeyscrollView;
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];

    [self setNavItem];
    
    [self addUI];
}

- (void)setNavItem{
    
    UIButton * rightButton = [[UIButton alloc] init];
    
    [rightButton setTitle:@"充值记录" forState:UIControlStateNormal];
    
    rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(saveRecordClick) forControlEvents:UIControlEventTouchDown];
    
    [rightButton sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
}

- (void)addUI{
    
    TopSaveMMoneyView * topSaveMMoneyView = [[TopSaveMMoneyView alloc] init];
    
    [self.view addSubview:topSaveMMoneyView];
    
    MiddleSaveMMoneyView * middleSaveMMoneyView = [[MiddleSaveMMoneyView alloc] init];
        
    [self.view addSubview:middleSaveMMoneyView];
    
    __weak __typeof(&*self)ws = self;

    [topSaveMMoneyView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(218));
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.top.equalTo(ws.view.mas_top);
        
    }];
    
    [middleSaveMMoneyView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.top.equalTo(topSaveMMoneyView.mas_bottom);
        
        make.bottom.offset(ScreenH - topSaveMMoneyView.ZLHH - 64);
        
    }];

}

- (void)saveRecordClick {
    
    SaveRecordVC * saveRecordVC = [[SaveRecordVC alloc] initWithStyle:UITableViewStylePlain];
    
    [self.navigationController pushViewController:saveRecordVC animated:YES];
}
@end
