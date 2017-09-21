//
//  JinYuanBaoMMoneyVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/5.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "JinYuanBaoMMoneyVC.h"
#import "TopJinYuanBaoView.h"
#import "BottomJinYuanBaoCell.h"
#import "JiYuanBaoCellItem.h"
#import "MiddleBMoneyView.h"
#import "SaveMMoneyVC.h"
#import "OutMMoneyVC.h"
#import "BankCardManaVC.h"
#import "SubJinYuanBaoVC.h"
#import "MainJYBMakeDateTVC.h"
@interface JinYuanBaoMMoneyVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *dictArray;

@property (nonatomic,strong)NSArray *itemArray;

@end

@implementation JinYuanBaoMMoneyVC

static NSString *CellIdentifier = @"Cell";

- (NSArray *)dictArray{
    
    if (!_dictArray) {
        
        NSDictionary * dictOne = @{@"name":@"存钱罐（3.84%）",@"money":@"自动竞购金元宝",@"rightMoney":@"¥0.00"};
        NSDictionary * dictTwo = @{@"name":@"金元宝（6.1%）",@"money":@"自动竞购金元宝",@"rightMoney":@"¥0.00"};
        NSDictionary * dictThree = @{@"name":@"金元宝定期投金额（10.6%）",@"money":@"自动竞购金元宝",@"rightMoney":@"¥0.00"};
        
        _dictArray = @[dictOne,dictTwo,dictThree];
    }
    return _dictArray;
}

- (NSArray *)itemArray{
    
    if (!_itemArray) {
        
        _itemArray = [JiYuanBaoCellItem mj_objectArrayWithKeyValuesArray:self.dictArray];
        
    }
    return _itemArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"金元宝投资";
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];

    [self setNavBar];
    
    [self addUI];
}

- (void)setNavBar{
    
    UIButton * rightButton = [[UIButton alloc] init];
    
    [rightButton setTitle:@"银行卡管理" forState:UIControlStateNormal];
    
    rightButton.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchDown];
    
    [rightButton sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (void)rightButtonClick{
    
    BankCardManaVC * bankCardManaVC = [[BankCardManaVC alloc] init];
    
    [self.navigationController pushViewController:bankCardManaVC animated:YES];
    
}

- (void)addUI{
    
    TopJinYuanBaoView * topJinYuanBaoView = [[TopJinYuanBaoView alloc] init];
    
    [self.view addSubview:topJinYuanBaoView];
    
    __weak __typeof(&*self)ws = self;
    
    [topJinYuanBaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.top.equalTo(ws.view.mas_top);
        
        make.height.offset(IphoneSize_Height(240));
    }];
    
    UIButton * saveMoneyBtn = [self setUpBtnWithStr:@"充值"];
    
    [saveMoneyBtn addTarget:self action:@selector(saveMoneyClick) forControlEvents:UIControlEventTouchDown];
    
    [saveMoneyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.offset(ScreenW/2);
        
        make.height.offset(IphoneSize_Height(50));
        
        make.top.equalTo(topJinYuanBaoView.mas_bottom);
        
        make.left.equalTo(ws.view.mas_left);
        
    }];
    
    UIButton * outMoneyBtn = [self setUpBtnWithStr:@"提现"];
    
    [outMoneyBtn addTarget:self action:@selector(outMoneyClick) forControlEvents:UIControlEventTouchDown];
    
    [outMoneyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(ScreenW/2);
        
        make.height.offset(IphoneSize_Height(50));
        
        make.top.equalTo(topJinYuanBaoView.mas_bottom);
        
        make.left.equalTo(saveMoneyBtn.mas_right);
        
    }];
    
    UIView * lineView = [[UIView alloc] init];
    
    lineView.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
    
    [self.view addSubview:lineView];

    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(28));

        make.centerX.offset(outMoneyBtn.ZLHW);
        
        make.centerY.equalTo(outMoneyBtn.mas_centerY);
    }];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.scrollEnabled = NO;
    
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.top.equalTo(saveMoneyBtn.mas_bottom).offset(IphoneSize_Height(10));
                
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
    
    }

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return IphoneSize_Height(60);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    MiddleBMoneyView * middleBMoneyView = [[MiddleBMoneyView alloc] init];
    
    tableView.tableFooterView = middleBMoneyView;
    
    tableView.tableFooterView.backgroundColor = [UIColor whiteColor];
    
    UILabel * bottomLabel = [[UILabel alloc] init];
    
    bottomLabel.text = @"账户资金由浦发支付托管";
    
    bottomLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(13)];
    
    bottomLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    
    [middleBMoneyView addSubview:bottomLabel];
    
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(IphoneSize_Height(68));
        
        make.centerX.equalTo(middleBMoneyView.mas_centerX);
        
        
    }];
    return middleBMoneyView;
}

- (UIButton * )setUpBtnWithStr:(NSString *)str{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];

    [btn setTitle:str forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor colorWithHexString:@"#1e78ff"] forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    btn.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:btn];
    
    return btn;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dictArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BottomJinYuanBaoCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[BottomJinYuanBaoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.item = self.itemArray[indexPath.row];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return IphoneSize_Height(75);
}

- (void)saveMoneyClick{
    
    SaveMMoneyVC * saveMMoneyVC = [[SaveMMoneyVC alloc] init];
    
    [self.navigationController pushViewController:saveMMoneyVC animated:YES];
}

- (void)outMoneyClick{
    
    OutMMoneyVC * outMMoneyVC = [[OutMMoneyVC alloc] init];
    
    [self.navigationController pushViewController:outMMoneyVC animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
            
        case 1:
            [self goSubJinYuanBaoVC];
            break;
        case 2:
            [self goJYBMakeSureDateVC];
            break;
        default:
            break;
    }
}

- (void)goSubJinYuanBaoVC {
    
    SubJinYuanBaoVC * subJinYuanBaoVC = [[SubJinYuanBaoVC alloc] init];
    
    [self.navigationController pushViewController:subJinYuanBaoVC animated:YES];
}

- (void)goJYBMakeSureDateVC {
    
    MainJYBMakeDateTVC * mainJYBMakeDateTVC = [[MainJYBMakeDateTVC alloc] init];
    
    [self.navigationController pushViewController:mainJYBMakeDateTVC animated:YES];
}
@end
