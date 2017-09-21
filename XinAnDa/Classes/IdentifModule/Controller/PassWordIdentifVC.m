//
//  PassWordIdentifVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "PassWordIdentifVC.h"
#import "MiddleView.h"
#import "MainTabBarVC.h"

@interface PassWordIdentifVC ()

@end

@implementation PassWordIdentifVC

- (void)viewDidLoad {
    
    self.intImageArray = @[@1,@1,@1];
    
    self.intLineArray = @[@1,@1];
    
    [super viewDidLoad];
    
    [self.goBtn setTitle:@"完成" forState:UIControlStateNormal];
    
    [self.goBtn addTarget:self action:@selector(goHomePage) forControlEvents:UIControlEventTouchDown];
    
    [self.goBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(44));
        
        make.left.equalTo(self.middleView.mas_left).offset(IphoneSize_Width(30));
        
        make.right.equalTo(self.middleView.mas_right).offset(IphoneSize_Width(-30));
        
        make.top.equalTo(self.middleView.mas_bottom).offset(IphoneSize_Height(50));
    }];
    
    [self.labelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString * tfArray[] = {@"设置6位交易密码",@"确认6位交易密码"};
        
        UITextField * tf = self.labelArray[idx];
        
        tf.placeholder= tfArray[idx];
    }];
    
    self.middleView.label.text = @"";
    
}

- (void)goHomePage{
    
    [UIApplication sharedApplication].keyWindow.rootViewController = [[MainTabBarVC alloc] init];
}


@end
