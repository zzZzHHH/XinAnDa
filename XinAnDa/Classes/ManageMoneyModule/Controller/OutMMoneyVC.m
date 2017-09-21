//
//  OutMMoneyVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/6.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "OutMMoneyVC.h"
#import "OutMoneyCollectionCell.h"
#import "OutMoneyBottomView.h"
#import "OutRecordVC.h"

@interface OutMMoneyVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,weak)UICollectionView * collectionView;

@end

@implementation OutMMoneyVC

static NSString * ID = @"collectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"取现";
    
    TPKeyboardAvoidingScrollView * tpKeyscrollView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.bounds];
    
    tpKeyscrollView.showsVerticalScrollIndicator = NO;
    
    self.view = tpKeyscrollView;
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    [self setNavItem];
    
    [self addUI];

}

- (void)setNavItem{
    
    UIButton * rightButton = [[UIButton alloc] init];
    
    [rightButton setTitle:@"取现记录" forState:UIControlStateNormal];
    
    rightButton.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(rightNavItemClick) forControlEvents:UIControlEventTouchDown];
    
    [rightButton sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
}

- (void)rightNavItemClick{
    
    OutRecordVC * outRecordVC = [[OutRecordVC alloc] init];
    
    [self.navigationController pushViewController:outRecordVC animated:YES];
}

- (void)addUI{
    
    [self addCollectionView];
    
    UIView * bottomView = [[OutMoneyBottomView alloc] init];
    
    [self.view addSubview:bottomView];
    
    __weak __typeof(&*self)ws = self;

    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(ws.collectionView.mas_bottom).offset(IphoneSize_Height(60));
        
        make.left.equalTo(ws.view.mas_left);
        
        make.height.offset(ScreenH - self.collectionView.ZLHH - 64 - IphoneSize_Height(85));
        
        make.width.offset(ScreenW);

    }];
}

-(void)addCollectionView{
    
    //设置布局
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(IphoneSize_Width(290), IphoneSize_Height(160));
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    layout.minimumInteritemSpacing = 0;
    
    layout.minimumLineSpacing = IphoneSize_Width(20);
   
    //创建CollectionView
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, IphoneSize_Width(25), ScreenW, IphoneSize_Height(160)) collectionViewLayout:layout];
    
    self.collectionView = collectionView;
    
    [self.collectionView setContentOffset:CGPointMake(IphoneSize_Width(268), 0) animated:NO];

    collectionView.pagingEnabled = NO;
    
    collectionView.backgroundColor = [UIColor whiteColor];
    
    collectionView.dataSource = self;
    
    collectionView.delegate = self;
    
    collectionView.bounces = NO;
    
    collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:collectionView];
    
    //注册collectionCell
    [collectionView registerClass:[OutMoneyCollectionCell class] forCellWithReuseIdentifier:ID];
}

#pragma mark -- collectionViewDateSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    OutMoneyCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];

    
    return cell;
}

#pragma mark -- 监听collectionView滚动完成（完成拖拽）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
 
    if (fabs(scrollView.contentOffset.x) < IphoneSize_Width(120)) {
        
        [self.collectionView setContentOffset:CGPointMake(IphoneSize_Width(-40), 0) animated:YES];
    } else if (fabs(scrollView.contentOffset.x) < IphoneSize_Width(430) && fabs(scrollView.contentOffset.x) > IphoneSize_Width(120)){
        
        [self.collectionView setContentOffset:CGPointMake(IphoneSize_Width(268), 0) animated:YES];
        
    } else if ( fabs(scrollView.contentOffset.x) > IphoneSize_Width(430)) {
        
        [self.collectionView setContentOffset:CGPointMake(IphoneSize_Width(575), 0) animated:YES];
    }
    
}
#pragma mark -- 减速停止了时执行，手触摸时执行执行
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (fabs(scrollView.contentOffset.x) < IphoneSize_Width(120)) {
        
        [self.collectionView setContentOffset:CGPointMake(IphoneSize_Width(-40), 0) animated:YES];
    } else if (fabs(scrollView.contentOffset.x) < IphoneSize_Width(430) && fabs(scrollView.contentOffset.x) > IphoneSize_Width(120)){
        
        [self.collectionView setContentOffset:CGPointMake(IphoneSize_Width(268), 0) animated:YES];
        
    } else if ( fabs(scrollView.contentOffset.x) > IphoneSize_Width(430)) {
        
        [self.collectionView setContentOffset:CGPointMake(IphoneSize_Width(575), 0) animated:YES];
    }
}


@end
