//
//  JYBDetailVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "JYBDetailVC.h"
#import "DetailTopView.h"
#import "DetailCenterTopView.h"
#import "DetailCenterBottomView.h"
#import "DetailBottomView.h"
@interface JYBDetailVC ()

@end

@implementation JYBDetailVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];

    self.title = @"投资详情";
    
    [self addUI];
}

- (void)addUI{
 
    DetailTopView * detailTopView = [[DetailTopView alloc] init];
    [self.view addSubview:detailTopView];
    
    DetailCenterTopView * detailCenterTopView=[[DetailCenterTopView alloc] init];
    [self.view addSubview:detailCenterTopView];
    
    DetailCenterBottomView * detailCenterBottomView = [[DetailCenterBottomView alloc] init];
    [self.view addSubview:detailCenterBottomView];
    
    DetailBottomView * detailBottomView = [[DetailBottomView alloc] init];
    [self.view addSubview:detailBottomView];
    
    __weak __typeof(&*self)ws = self;

    [detailTopView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.offset(ScreenW);
        
        make.left.equalTo(ws.view.mas_left);
        
        make.height.offset(IphoneSize_Height(115));
        
        make.top.equalTo(ws.view.mas_top).offset(TabBarH + IphoneSize_Height(10));
    }];
    
    [detailCenterTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(ScreenW);
        
        make.left.equalTo(ws.view.mas_left);
        
        make.height.offset(IphoneSize_Height(180));
        
        make.top.equalTo(detailTopView.mas_bottom).offset(IphoneSize_Height(10));
    }];
    
    [detailCenterBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(ScreenW);
        
        make.left.equalTo(ws.view.mas_left);
        
        make.height.offset(IphoneSize_Height(115));
        
        make.top.equalTo(detailCenterTopView.mas_bottom).offset(IphoneSize_Height(10));
    }];
    
    [detailBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(ScreenW);
        
        make.left.equalTo(ws.view.mas_left);
        
        make.height.offset(IphoneSize_Height(145));
        
        make.top.equalTo(detailCenterBottomView.mas_bottom).offset(IphoneSize_Height(10));
    }];
}

@end
