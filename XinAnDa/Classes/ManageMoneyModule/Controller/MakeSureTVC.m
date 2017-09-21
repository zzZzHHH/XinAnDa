//
//  MakeSureTVC.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/10.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MakeSureTVC.h"
#import "MakeSureCell.h"
#import "JYBDetailVC.h"

@interface MakeSureTVC ()

@end

@implementation MakeSureTVC

static NSString * ID = @"collectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#f7faff"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return IphoneSize_Height(138);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MakeSureCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        
        cell = [[MakeSureCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.row == 0) {
        
        cell.lendBtn.hidden = NO;
    }
    
    if (indexPath.row == 1) {
        
        cell.lendLabel.text = @"转让中";
        
        cell.lendLabel.textColor = [UIColor colorWithHexString:@"ff7979"];
    }
    
    if (indexPath.row == 2) {
        
        cell.lendLabel.text = @"已转让";
    
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JYBDetailVC * jybDetailVC = [[JYBDetailVC alloc] init];
    
    [self.navigationController pushViewController:jybDetailVC animated:YES];
}

@end
