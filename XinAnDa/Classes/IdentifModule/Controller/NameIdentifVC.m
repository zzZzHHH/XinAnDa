//
//  NameIdentifVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "NameIdentifVC.h"
#import "CardIdentifVC.h"

@interface NameIdentifVC ()

@end

@implementation NameIdentifVC

- (void)viewDidLoad{
    
    self.intImageArray = @[@1,@0,@0];
    
    self.intLineArray = @[@1,@0];
    
    [super viewDidLoad];
    
    [self.goBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchDown];
}

- (void)nextStep{
    
    CardIdentifVC * cardIdentifVC = [[CardIdentifVC alloc] init];
    
    [self.navigationController pushViewController:cardIdentifVC animated:YES];
}

@end
