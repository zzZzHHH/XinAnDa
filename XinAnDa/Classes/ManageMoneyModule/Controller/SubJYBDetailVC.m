//
//  SubJYBDetailVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/10.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SubJYBDetailVC.h"
#import "SubJYBHeardView.h"
#import "SubJYBCell.h"
#import "SubJYBItem.h"
#import "SubJYBSecondCell.h"
@interface SubJYBDetailVC ()

@property (nonatomic,strong)NSArray *dictArray;
@property (nonatomic,strong)NSArray *sectionArray;
@end

@implementation SubJYBDetailVC

static NSString *CellIdentifier = @"Cell";
static NSString *CellSecondIdentifier = @"CellSecond";

- (NSArray *)dictArray{
    
    if (!_dictArray) {
        
        _dictArray = @[@[@{@"title":@"借款期限",@"value":@"18个月"},
                            @{@"title":@"每个月还款日",@"value":@"6日"},
                            @{@"title":@"借款金额",@"value":@"72450.00"},
                            @{@"title":@"投资利率",@"value":@"6.6%"},
                            @{@"title":@"借款编号",@"value":@"PAN0001"},
                         @{@"title":@"还款方式",@"value":@"等额本息"}]
                       ,@[@{@"title":@"查看合同",@"value":@">"},
                          @{@"title":@"保证方式",@"value":@">"}],
                       @[@{@"title":@"借款人",@"value":@"*忠*"},
                         @{@"title":@"身份证号",@"value":@"2104**********3917"},
                         @{@"title":@"性别",@"value":@"男"},
                         @{@"title":@"年龄",@"value":@"33"},
                         @{@"title":@"手机号",@"value":@"139****3363"},
                         @{@"title":@"信用卡最高额度",@"value":@"36000"}],
                       @[],
                       @[@{@"title":@"正常还清",@"value":@"9次"},
                         @{@"title":@"准备金垫付",@"value":@"0次"}]];
        
    }
    return _dictArray;
}

- (NSArray *)sectionArray{
    
    if (!_sectionArray) {
        
        _sectionArray = @[@"项目详情",@"",@"借款人基本信息",@"借款人审核认证",@"项目还款情况"];
        
    }
    return _sectionArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"项目详情";
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dictArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 3) {
        
        return 1;
    }
    
    NSArray * array = self.dictArray[section];
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 3) {
        
        SubJYBSecondCell * cell = [tableView dequeueReusableCellWithIdentifier:CellSecondIdentifier];
        
        if (!cell) {
            
            cell = [[SubJYBSecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellSecondIdentifier];
        }
        
        return cell;
    }
    
    SubJYBCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[SubJYBCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSArray * array = self.dictArray[indexPath.section];
    
    NSArray * modelArray = [SubJYBItem mj_objectArrayWithKeyValuesArray:array];
    
    cell.item = modelArray[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SubJYBHeardView * subJYBHeardView = [[SubJYBHeardView alloc] init];
    
    subJYBHeardView.backgroundColor = [UIColor whiteColor];
    
    subJYBHeardView.label.text = self.sectionArray[section];
    
    if (section == 1) {
        
        return nil;
    }
    
    return subJYBHeardView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 3) {
        
        return IphoneSize_Width(90);
    }
    
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        
        return IphoneSize_Height(1);
    }
    
    return IphoneSize_Height(55);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return IphoneSize_Height(10);
}

@end
