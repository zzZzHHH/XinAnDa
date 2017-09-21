//
//  SubJinYuanBaoVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/10.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SubJinYuanBaoVC.h"
#import "TopJinYuanBaoView.h"
#import "JiYuanBaoCellItem.h"
#import "BottomJinYuanBaoCell.h"
#import "SubJYBDetailVC.h"
@interface SubJinYuanBaoVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *dictArray;

@property (nonatomic,strong)NSArray *itemArray;

@end

@implementation SubJinYuanBaoVC

static NSString *CellIdentifier = @"Cell";

- (NSArray *)dictArray{
    
    if (!_dictArray) {
        
        NSDictionary * dictOne = @{@"name":@"贷款人*宗*",@"money":@"投资本金56.76",@"time":@"变更时间 05/11 14:36",@"day":@"剩余天数 298天"};
        
        _dictArray = @[dictOne];
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
    
    self.title = @"金元宝";
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    [self addUI];
}

- (void)addUI{
    
    TopJinYuanBaoView * topJinYuanBaoView = [[TopJinYuanBaoView alloc] init];
    
    topJinYuanBaoView.problemBtn.hidden = NO;
    
    topJinYuanBaoView.labelOne.text = @"91.26";
    
    topJinYuanBaoView.labelTwo.text = @"人品宝本金";
    
    topJinYuanBaoView.labelThree.text = @"未结收益¥0.15元（可取现）";
    
    [self.view addSubview:topJinYuanBaoView];
    
    __weak __typeof(&*self)ws = self;
    
    [topJinYuanBaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.view.mas_left);
        
        make.width.offset(ScreenW);
        
        make.top.equalTo(ws.view.mas_top);
        
        make.height.offset(IphoneSize_Height(240));
    }];
    
    UILabel * detailLabel = [[UILabel alloc] init];;
    
    detailLabel.text = @"人品宝竞购明细";
    
    detailLabel.textColor = [UIColor colorWithHexString:@"#1e78ff"];
    
    detailLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    [self.view addSubview:detailLabel];
    
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(topJinYuanBaoView.mas_bottom).offset(IphoneSize_Height(17));
        make.left.equalTo(ws.view.mas_left).offset(IphoneSize_Width(9));
        
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
        
        make.top.equalTo(detailLabel.mas_bottom).offset(IphoneSize_Height(17));
        
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
};


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BottomJinYuanBaoCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[BottomJinYuanBaoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.item = self.itemArray[0];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return IphoneSize_Height(75);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SubJYBDetailVC * subJYBDetailVC = [[SubJYBDetailVC alloc] initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:subJYBDetailVC animated:YES];
}

@end
