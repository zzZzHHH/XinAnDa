//
//  SafeMMoneyVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/5.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SafeMMoneyVC.h"

@interface SafeMMoneyVC ()

@end

@implementation SafeMMoneyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGround"]]];
    
    self.title = @"安全保障";
    
    [self addAllChildViewController];
}

- (void)addAllChildViewController{
    
    //产品介绍
    UIViewController * allVC = [[UIViewController alloc] init];
    allVC.title = @"产品介绍";
    [self addChildViewController:allVC];
    
    //安全介绍
    UIViewController * videoVC = [[UIViewController alloc] init];
    videoVC.title = @"安全介绍";
    [self addChildViewController:videoVC];
    
    //风控体系
    UIViewController * voiceVC = [[UIViewController alloc] init];
    voiceVC.title = @"风控体系";
    [self addChildViewController:voiceVC];
    
    //"企业荣誉
    UIViewController * pictureVC = [[UIViewController alloc] init];
    pictureVC.title = @"企业荣誉";
    [self addChildViewController:pictureVC];
  
    
}

@end
