//
//  SaveRecordVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/6.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SaveRecordVC.h"
#import "SaveRecordCellItem.h"
#import "SaveRecordCell.h"

@interface SaveRecordVC ()

@property (nonatomic,strong)NSArray *dictArray;

@property (nonatomic,strong)NSArray *itemArray;

@end

@implementation SaveRecordVC

static NSString *CellIdentifier = @"Cell";

- (NSArray *)dictArray{
    
    if (!_dictArray) {
        
        NSDictionary * dictOne = @{@"name":@"充值-招商银行-1957",@"time":@"2017-5-30 13:18:24",@"money":@"¥200.00",@"state":@"充值成功",@"stateNo":@1};
        NSDictionary * dictTwo = @{@"name":@"充值-招商银行-1957",@"time":@"2017-5-30 13:18:24",@"money":@"¥200.00",@"state":@"充值失败:银行处理失败",@"stateNo":@2};
        
        _dictArray = @[dictOne,dictTwo];
    }
    return _dictArray;
}

- (NSArray *)itemArray{
    
    if (!_itemArray) {
        
        _itemArray = [SaveRecordCellItem mj_objectArrayWithKeyValuesArray:self.dictArray];
        
    }
    return _itemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.title = @"充值记录";

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dictArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SaveRecordCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[SaveRecordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.item = self.itemArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return IphoneSize_Height(70);
}
@end
