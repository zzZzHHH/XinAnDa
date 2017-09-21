//
//  MainMineVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/4.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainMineVC.h"
#import "TopMainMineView.h"
#import "BottomMineCell.h"
#import "BottomCellItem.h"
@interface MainMineVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *dictArray;

@property (nonatomic,strong)NSArray *itemArray;

@end

@implementation MainMineVC

static NSString *CellIdentifier = @"Cell";

- (NSArray *)dictArray{
    
    if (!_dictArray) {

        NSDictionary * dictOne = @{@"image":@"MineLend",@"title":@"我的借款"};
        NSDictionary * dictTwo = @{@"image":@"MineSave",@"title":@"我的存款"};
        NSDictionary * dictThree = @{@"image":@"MineP",@"title":@"人品专家"};
        NSDictionary * dictFour = @{@"image":@"MineS",@"title":@"设置"};
        
        _dictArray = @[dictOne,dictTwo,dictThree,dictFour];
    }
    return _dictArray;
}

- (NSArray *)itemArray{
    
    if (!_itemArray) {
        
        _itemArray = [BottomCellItem mj_objectArrayWithKeyValuesArray:self.dictArray];

    }
    return _itemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];    
    
    [self setNavItem];
    
    [self addUI];
}

- (void)addUI{
    
    TopMainMineView * topMainMineView = [[TopMainMineView alloc] init];
    
    [self.view addSubview:topMainMineView];
    
    __weak __typeof(&*self)ws = self;
    
    [topMainMineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.top.equalTo(ws.view.mas_top);
        
        make.height.offset(IphoneSize_Height(250));
    }];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
      
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.scrollEnabled = NO;
    
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.top.equalTo(topMainMineView.mas_bottom).offset(IphoneSize_Height(15));
        
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dictArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return IphoneSize_Height(5);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return IphoneSize_Height(5);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    BottomMineCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        //单元格样式设置为UITableViewCellStyleDefault
        cell = [[BottomMineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.item = self.itemArray[indexPath.section];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return IphoneSize_Height(55);
}

- (void)setNavItem{
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightBtn setImage:[UIImage imageNamed:@"Message"] forState:UIControlStateNormal];
    
    rightBtn.ZLHW = IphoneSize_Width(21);
    
    rightBtn.ZLHH = IphoneSize_Height(21);
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}

@end
