//
//  MainNavC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/6/30.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainNavC.h"

@interface MainNavC () <UIGestureRecognizerDelegate,UINavigationControllerDelegate >
@property (nonatomic,strong)UIPanGestureRecognizer * panGesture;

@end

@implementation MainNavC

+ (void)load{
    
    //获取全局的bar
    UINavigationBar * bar = [UINavigationBar appearance];
    
    //文本
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:IphoneSize_Font(18)];
    
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    bar.titleTextAttributes = dict;
    
}

#pragma mark -- 设置全局返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
        
    if (self.childViewControllers.count) {
    
        //创建按钮
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //设置图片
        [btn setImage:[UIImage imageNamed:@"NavReturn"] forState:UIControlStateNormal];
        
        //尺寸自适应
        btn.ZLHH = IphoneSize_Height(20);
        btn.ZLHW = IphoneSize_Width(20);
        
        //添加按钮
        [btn addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
        
        //隐藏底部的TabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
    
}

- (void)clickBack{
    
    [self popViewControllerAnimated:YES];
}

@end
