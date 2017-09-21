//
//  ZLHBaseViewController.h
//  MakeThingss
//
//  Created by 周立贺 on 16/7/15.
//  Copyright © 2016年 周立贺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainAppearVC.h"

@interface ZLHBaseViewController : MainAppearVC

@property (nonatomic,weak)UIScrollView *scrollView;

@property (nonatomic,weak)UICollectionView *collectionView;

@end
