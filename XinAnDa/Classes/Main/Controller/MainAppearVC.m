//
//  MainAppearVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/5.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainAppearVC.h"
//#import "UINavigationController+FDFullscreenPopGesture.h"

@interface MainAppearVC ()

@end

@implementation MainAppearVC

- (void)viewDidLoad{
    
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setTranslucent:YES];
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    //重置导航栏背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"BackGround"] forBarMetrics:UIBarMetricsDefault];
}

@end
