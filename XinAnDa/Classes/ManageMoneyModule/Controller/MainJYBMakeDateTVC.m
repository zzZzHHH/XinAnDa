//
//  MainJYBMakeDateTVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainJYBMakeDateTVC.h"
#import "MainMakeDateCell.h"
#import "MainMakeDateItem.h"
#import "JYBMakeSureDateVC.h"
#import "MakeDateOutMoneyVC.h"
@interface MainJYBMakeDateTVC ()

@property (nonatomic,strong)NSArray *dictArray;

@property (nonatomic,strong)NSArray *itemArray;

@end

@implementation MainJYBMakeDateTVC

static NSString * ID = @"collectionCell";

- (NSArray *)dictArray{
    
    if (!_dictArray) {
        
        _dictArray = @[@{@"pre":@"7.00%",@"date":@"3个月",@"sale":@YES},
                       @{@"pre":@"8.00%",@"date":@"9个月",@"sale":@NO},
                       @{@"pre":@"7.60%",@"date":@"6个月",@"sale":@NO}];
    }
    return _dictArray;
}

- (NSArray *)itemArray{
    
    if (!_itemArray) {
        
        _itemArray = [MainMakeDateItem mj_objectArrayWithKeyValuesArray:self.dictArray];
        
    }
    return _itemArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    self.title = @"金元宝定期";
    
    [self setNavBar];
}

- (void)setNavBar{
    
    UIButton * rightButton = [[UIButton alloc] init];
    
    [rightButton setTitle:@"我的定期" forState:UIControlStateNormal];
    
    rightButton.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchDown];
    
    [rightButton sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return IphoneSize_Height(140);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainMakeDateCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        
        cell = [[MainMakeDateCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.item = self.itemArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MakeDateOutMoneyVC * makeDateOutMoneyVC = [[MakeDateOutMoneyVC alloc] init];
    
    [self.navigationController pushViewController:makeDateOutMoneyVC animated:YES];
}

- (void)rightButtonClick{
    
    JYBMakeSureDateVC * jybMakeSureDateVC = [[JYBMakeSureDateVC alloc] init];
    
    [self.navigationController pushViewController:jybMakeSureDateVC animated:YES];
}

@end
