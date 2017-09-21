//
//  JYBMakeSureDateVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/10.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "JYBMakeSureDateVC.h"
#import "ZLHBaseViewController.h"
#import "SubBottomView.h"
#import "MakeSureTVC.h"
@interface JYBMakeSureDateVC ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,weak)UIScrollView *scrollView;

@property (nonatomic,weak)UICollectionView *collectionView;

@property (nonatomic,weak)UIButton *selectedBtn;

@property (nonatomic,strong)NSMutableArray *btnArray;

@property (nonatomic,strong)UIView *bottomLine;

@property (nonatomic,assign)BOOL isInitial;

@end

@implementation JYBMakeSureDateVC

static NSString * ID = @"collectionCell";

#pragma mark -- 懒加载
- (NSMutableArray *)btnArray{
    
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // iOS7之后，如果是导航控制器下scrollView,顶部都会添加64的额外滚动区域
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    self.title = @"金元宝定期";
    
    //添加的scrollerView
    [self addScrollerView];
    
    //添加collectionView
    [self addCollectionView];
    
    //添加子控制器
    [self addAllChildViewController];
    
    //添加UI
    [self addUI];
    
}

- (void)addAllChildViewController{
    
    //产品介绍
    MakeSureTVC * allVC = [[MakeSureTVC alloc] init];
    allVC.title = @"处理中";
    [self addChildViewController:allVC];
    
    //安全介绍
    MakeSureTVC * videoVC = [[MakeSureTVC alloc] init];
    videoVC.title = @"持有中";
    [self addChildViewController:videoVC];
    
    //风控体系
    MakeSureTVC * voiceVC = [[MakeSureTVC alloc] init];
    voiceVC.title = @"已结束";
    [self addChildViewController:voiceVC];
    
}

- (void)addUI{
    
    UIView * bottomView = [[UIView alloc] init];
    
    [bottomView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGround"]]];
    
    __weak __typeof(&*self)ws = self;

    [self.view addSubview:bottomView];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(ws.view.mas_left);
        
        make.right.equalTo(ws.view.mas_right);
        
        make.top.equalTo(ws.view.mas_top);
        
        make.height.offset(IphoneSize_Height(140));
        
    }];
    
    SubBottomView * subBottomView = [[SubBottomView alloc] init];
    
    [self.view addSubview:subBottomView];
    
    [subBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.offset(IphoneSize_Height(90));
        
        make.left.equalTo(ws.view.mas_left).offset(IphoneSize_Width(15));
        
        make.width.offset(ScreenW - IphoneSize_Width(30));
        
        make.top.equalTo(ws.view.mas_top).offset(IphoneSize_Height(94));
        
    }];
    
}

#pragma mark -- 设置所有标题
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    if (_isInitial == NO) {
        
        // 设置所有标题
        [self setAllTitle];
        
        _isInitial = YES;
    }
}

#pragma mark -- 添加顶部的ScrollerView
- (void)addScrollerView{
    
    UIScrollView * scrollerView = [[UIScrollView alloc] init];
    
    _scrollView = scrollerView;
    
    //设置Frame
    CGFloat scrollH = IphoneSize_Height(30);
    
    scrollerView.frame = CGRectMake(0, 64 + IphoneSize_Height(160), ScreenW, scrollH);
    //添加子控件
    [self.view addSubview:scrollerView];
}

#pragma mark -- 添加CollectionView
-(void)addCollectionView{
    
    //设置布局
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(self.view.ZLHW, self.view.ZLHH - 64 - IphoneSize_Height(160) - self.scrollView.ZLHH);
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    layout.minimumInteritemSpacing = 0;
    
    layout.minimumLineSpacing = 0;
    
    //创建CollectionView
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64 + self.scrollView.ZLHH + IphoneSize_Height(160), self.view.ZLHW, self.view.ZLHH - 64 - self.scrollView.ZLHH - IphoneSize_Height(160)) collectionViewLayout:layout];
    
    _collectionView = collectionView;
    
    collectionView.pagingEnabled = YES;
    
    collectionView.backgroundColor = [UIColor whiteColor];
    
    collectionView.dataSource = self;
    
    collectionView.delegate = self;
    
    collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:collectionView];
    
    //注册collectionCell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}

#pragma mark -- collectionViewDateSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.childViewControllers.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    //设置颜色
    cell.backgroundColor = [UIColor whiteColor];
    
    //添加之前先移除之前的
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //添加tableView到Cell的内容视图上
    UITableViewController * vc = self.childViewControllers[indexPath.row];
    vc.view.frame = CGRectMake(0, 0, collectionView.ZLHW, collectionView.ZLHH);
    [cell.contentView addSubview:vc.view];
    
    return cell;
}

#pragma mark -- setAllTitle
- (void)setAllTitle{
    //数量
    NSInteger count = self.childViewControllers.count;
    
    CGFloat W = ScreenW / count;
    
    CGFloat H = _scrollView.ZLHH;
    
    CGFloat X = 0;
    
    CGFloat Y = 0;
    
    for (int i = 0; i < count; i++) {
        
        X = i * W;
        
        //创建按钮
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        //设置btn的tag
        btn.tag = i;
        
        //设置Frame
        btn.frame = CGRectMake(X, Y, W, H);
        
        //设置标题
        UIViewController * vc = self.childViewControllers[i];
        
        btn.contentEdgeInsets = UIEdgeInsetsMake(0 , 0, IphoneSize_Height(13), 0);
        
        [btn setTitle:vc.title forState:UIControlStateNormal];
        //设置颜色
        [btn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor colorWithHexString:@"#1e78ff"] forState:UIControlStateSelected];
        //设置字体大小
        btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(16)];
        
        //默认选中第一个
        if (btn.tag == 0) {
            
            [self selectedButton:btn];
            
            //添加下划线,
            UIView * bottomLine = [[UIView alloc] init];
            
            _bottomLine = bottomLine;
            //设置线的颜色
            bottomLine.backgroundColor = [UIColor colorWithHexString:@"#1e78ff"];
            //添加
            [_scrollView addSubview:bottomLine];
            
            bottomLine.ZLHW = IphoneSize_Width(46);
            
            bottomLine.ZLHCenterX = btn.ZLHCenterX;
            
            bottomLine.ZLHH = IphoneSize_Height(1.5);
            
            bottomLine.ZLHY = btn.ZLHH - IphoneSize_Height(1.5);
            
        }
        
        //监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.btnArray addObject:btn];
        
        //添加
        [_scrollView addSubview:btn];
    }
}

#pragma mark -- 按钮点击方法
- (void)btnClick:(UIButton *)btn{
    
    //让按钮成为选中状态
    [self selectedButton:(btn)];
    
    //点击按钮,让scrollerView进行滚动
    NSInteger i = btn.tag;
    
    CGFloat offsetX = i * _collectionView.ZLHW;
        
    _collectionView.contentOffset = CGPointMake(offsetX, 0);
}

#pragma mark -- 选中按钮
- (void)selectedButton:(UIButton *)btn{
    
    //设置按钮选中状态
    _selectedBtn.selected = NO;
    
    btn.selected = YES;
    
    _selectedBtn = btn;
    
    //移动下划线
    [UIView animateWithDuration:0.25 animations:^{
        
        _bottomLine.ZLHCenterX = btn.ZLHCenterX;
    }];
}

#pragma mark -- 监听collectionView滚动完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //滚动选中按钮
    NSInteger i = scrollView.contentOffset.x / ScreenW;
    
    [self selectedButton:self.btnArray[i]];
}

@end
