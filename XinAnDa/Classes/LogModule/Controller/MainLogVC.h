//
//  MainLogVC.h
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TextView;

@interface MainLogVC : UIViewController

@property (nonatomic,strong)NSString * btnTitle;

@property (nonatomic,weak)UITextField * telNumTF;

@property (nonatomic,weak)UITextField * testCodeTF;

@property (nonatomic,weak)UITextField * passWordTF;

@property (nonatomic,weak)UITextField * rePassWordTF;

@property (nonatomic,weak)UIView * rePassWordView;

@property (nonatomic,weak)UIButton * goBtn;

@property (nonatomic,weak)UIButton * getCodeBtn;

@end
