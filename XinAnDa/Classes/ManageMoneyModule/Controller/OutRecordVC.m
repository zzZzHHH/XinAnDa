//
//  OutRecordVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/7.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "OutRecordVC.h"
#import "OutRecordCellItem.h"
#import "OutRecordCell.h"

@interface OutRecordVC ()

@property (nonatomic,strong)NSMutableArray *dictArray;

@property (nonatomic,strong)NSArray *itemArray;

@end

@implementation OutRecordVC

static NSString *CellId = @"Cell";

- (NSMutableArray *)dictArray{
    
    if (!_dictArray) {
        
        _dictArray = [NSMutableArray array];
        
        for (int i = 0; i < 8; i++) {
            
            NSDictionary * dict = @{@"time":@"2017-5-30 13:18:24",@"money":@"¥200.00"};
            
            [_dictArray addObject:dict];
        }
        
    }
    return _dictArray;
}

- (NSArray *)itemArray{
    
    if (!_itemArray) {
        
        _itemArray = [OutRecordCellItem mj_objectArrayWithKeyValuesArray:self.dictArray];
        
    }
    return _itemArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.title = @"提现记录";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dictArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OutRecordCell * cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    
    if (!cell) {
        
        cell = [[OutRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    
    cell.item = self.itemArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return IphoneSize_Height(55);
}

@end
