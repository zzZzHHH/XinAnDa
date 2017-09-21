//
//  BottomJinYuanBaoCell.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/5.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "BottomJinYuanBaoCell.h"

@interface BottomJinYuanBaoCell ()

@property (nonatomic,weak)UILabel * labelName;

@property (nonatomic,weak)UILabel * labelMoney;

@property (nonatomic,weak)UILabel * labelTime;

@property (nonatomic,weak)UILabel * labelDay;

@property (nonatomic,weak)UILabel * labelRightMoney;

@end

@implementation BottomJinYuanBaoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {

        
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        UILabel * labelName = [self setUpLabelWithText:@"金元宝（6.1%）" TextColor:@"#333333" Size:15];
        
        self.labelName = labelName;
        
        UILabel * labelMoney = [self setUpLabelWithText:@"自动竞购金元宝" TextColor:@"#999999" Size:12];
        
        self.labelMoney = labelMoney;
        
        UILabel * labelTime = [self setUpLabelWithText:@"变更时间 05/11 14:36" TextColor:@"#999999" Size:12];
        
        self.labelTime = labelTime;
        
        UILabel * labelDay = [self setUpLabelWithText:@"剩余天数 289天" TextColor:@"#999999" Size:12];
        
        self.labelDay = labelDay;
                
        UILabel * labelRightMoney = [self setUpLabelWithText:@"¥0.00" TextColor:@"#1e78ff" Size:15];
        
        self.labelRightMoney = labelRightMoney;
        
        __weak __typeof(&*self)ws = self;
        
        [labelName mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(10));
            
            make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(14));
            
        }];
        [labelMoney mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(labelName.mas_left);
            
            make.top.equalTo(labelName.mas_bottom).offset(IphoneSize_Height(9));
            
        }];
        
        [labelTime mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(ws.mas_right).offset(IphoneSize_Width(-10));
            
            make.bottom.equalTo(labelName.mas_bottom);
            
        }];
        
        [labelDay mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.equalTo(labelTime.mas_right);
            
            make.bottom.equalTo(labelMoney.mas_bottom);
            
        }];
        
        [labelRightMoney mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(ws.mas_centerY);
            
            make.right.equalTo(labelDay.mas_right);
            
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
    
    frame.size.height -= IphoneSize_Height(10);
    
    [super setFrame:frame];
}


- (void)setItem:(JiYuanBaoCellItem *)item{

    self.labelName.text = item.name;
    
    self.labelMoney.text = item.money;
    
    self.labelTime.text = item.time;
    
    self.labelDay.text = item.day;
    
    self.labelRightMoney.text = item.rightMoney;

}

@end
