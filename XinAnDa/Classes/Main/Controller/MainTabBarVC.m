//
//  MainTabBarVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/4.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainTabBarVC.h"
#import "MainNavC.h"
#import "MainMMoneyVC.h"
#import "MainBMoneyVC.h"
#import "MainMineVC.h"

@interface MainTabBarVC ()

@end

@implementation MainTabBarVC

+(void)load{
    
    //获取全局的tabBarItem
    UITabBarItem * item = [UITabBarItem appearance];
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    //设置颜色
    dict[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#1e78ff"];
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    NSMutableDictionary * dictText = [NSMutableDictionary dictionary];
    //设置字体
    dictText[NSFontAttributeName] = [UIFont systemFontOfSize:IphoneSize_Font(13)];

    [item setTitleTextAttributes:dictText forState:UIControlStateNormal];

    [UITabBar appearance].translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#63c0ff"];
   
    [self addChildVC];
    
    [self setTabBarTextAndImage];
}

- (void)addChildVC{
    
    //理财
    MainMMoneyVC * mainMMoneyVC = [[MainMMoneyVC alloc] init];
    [self setNavVCWithViewController:mainMMoneyVC];
    
    //贷款
    MainBMoneyVC * mainBMoneyVC = [[MainBMoneyVC alloc] init];
    [self setNavVCWithViewController:mainBMoneyVC];
    
    //我的
    MainMineVC * mainMineVC = [[MainMineVC alloc] init];
    [self setNavVCWithViewController:mainMineVC];
}

#pragma mark -- 添加Nav控制器
- (void)setNavVCWithViewController:(UIViewController *)VC{
    
    MainNavC * mainNavC = [[MainNavC alloc] initWithRootViewController:VC];
    
    [self addChildViewController:mainNavC];
    
    [VC.tabBarController.tabBar setBackgroundImage:[UIImage new]];
    [VC.tabBarController.tabBar setShadowImage:[UIImage new]];
}

- (void)setTabBarTextAndImage{
   
    [self setTabBarBtnWithIndex:0 Title:@"理财" Image:[UIImage imageNamed:@"MMoney"]SelectedImage:[UIImage imageNamed:@"MMoneySelect"]];
    
    [self setTabBarBtnWithIndex:1 Title:@"贷款" Image:[UIImage imageNamed:@"BMoney"]SelectedImage:[UIImage imageNamed:@"BMoneySelect"]];
    
    [self setTabBarBtnWithIndex:2 Title:@"我的" Image:[UIImage imageNamed:@"Mine"]SelectedImage:[UIImage imageNamed:@"MineSelect"]];
}

- (void)setTabBarBtnWithIndex:(int)index Title:(NSString *)title Image:(UIImage *)image SelectedImage:(UIImage *)selectImage{
    
    MainNavC *mainNavC = self.childViewControllers[index];
    mainNavC.tabBarItem.title = title;
    mainNavC.tabBarItem.image = image;
    mainNavC.tabBarItem.selectedImage = selectImage;
}
@end
