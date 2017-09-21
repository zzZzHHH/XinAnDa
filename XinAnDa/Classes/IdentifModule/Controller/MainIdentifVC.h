//
//  MainIdentifVC.h
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TopView;

@class MiddleView;

@interface MainIdentifVC : UIViewController

@property (nonatomic,weak)UIButton * goBtn;

@property (nonatomic,strong)NSArray *intImageArray;

@property (nonatomic,strong)NSArray *intLineArray;

@property (nonatomic,strong)NSArray *labelArray;

@property (nonatomic,strong)MiddleView *middleView;

@end
