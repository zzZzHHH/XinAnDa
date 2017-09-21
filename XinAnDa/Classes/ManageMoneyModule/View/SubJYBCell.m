//
//  SubJYBCell.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/10.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SubJYBCell.h"

@interface SubJYBCell()

@property (nonatomic,weak)UILabel * labelTitle;

@property (nonatomic,weak)UILabel * valueLabel;

@end

@implementation SubJYBCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        UILabel * labelTitle = [[UILabel alloc] init];
        
        labelTitle.text = @"项目详情";
        
        labelTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        
        labelTitle.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
        
        self.labelTitle = labelTitle;
        
        [self addSubview:labelTitle];
        
        __weak __typeof(&*self)ws = self;
        
        [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(14));
            
            make.centerY.equalTo(ws.mas_centerY);
        }];
        
        UILabel * valueLabel = [[UILabel alloc] init];
        
        valueLabel.text = @"18个月";
        
        valueLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        
        valueLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
        
        self.valueLabel = valueLabel;
        
        [self addSubview:valueLabel];
        
        [valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(ws.mas_right).offset(IphoneSize_Width(-14));
            
            make.centerY.equalTo(ws.mas_centerY);
        }];
        
    }
    return self;
}

- (void)setItem:(SubJYBItem *)item{
    
    self.labelTitle.text = item.title;
    
    self.valueLabel.text = item.value;
    
}
@end
