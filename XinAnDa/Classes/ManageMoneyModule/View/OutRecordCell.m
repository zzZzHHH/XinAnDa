//
//  OutRecordCell.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/7.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "OutRecordCell.h"

@interface OutRecordCell()

@property (nonatomic,weak)UILabel * labelTime;

@property (nonatomic,weak)UILabel * labelTiXian;

@property (nonatomic,weak)UILabel * labelMoney;

@end


@implementation OutRecordCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        UILabel * labelTime = [self setUpLabelWithText:@"1111" TextColor:@"#333333" Size:15];
        
        self.labelTime = labelTime;
        
        UILabel * labelTiXian = [self setUpLabelWithText:@"提现" TextColor:@"#999999" Size:15];
        
        self.labelTiXian = labelTiXian;
        
        UILabel * labelMoney = [self setUpLabelWithText:@"1111" TextColor:@"#1e78ff" Size:15];
        
        self.labelMoney = labelMoney;
        
        __weak __typeof(&*self)ws = self;

        [labelTime mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(12));
            
            make.centerY.equalTo(ws.mas_centerY);
            
        }];
        
        [labelTiXian mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(200));
            
            make.centerY.equalTo(ws.mas_centerY);
            
        }];
        
        [labelMoney mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.right.equalTo(ws.mas_right).offset(IphoneSize_Width(-12));
            
            make.centerY.equalTo(ws.mas_centerY);
            
        }];
    }
    return self;
}

- (UILabel *)setUpLabelWithText:(NSString *)text TextColor:(NSString *)textColor Size:(CGFloat)size{
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = text;
    
    label.textColor = [UIColor colorWithHexString:textColor];
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(size)];
    
    [self addSubview:label];
    
    return label;
}

-(void)setFrame:(CGRect)frame{
    
    frame.size.height -= IphoneSize_Height(2);
    
    [super setFrame:frame];
}

- (void)setItem:(OutRecordCellItem *)item{
    
    self.labelTime.text = item.time;
    
    self.labelMoney.text = item.money;
    
}
@end
