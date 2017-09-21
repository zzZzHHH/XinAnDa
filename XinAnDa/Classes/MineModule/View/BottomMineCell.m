//
//  BottomMineCell.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/5.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "BottomMineCell.h"
#import "BottomCellItem.h"

@interface BottomMineCell ()

@property (nonatomic,weak)UIImageView * imageFView;

@property (nonatomic,weak)UILabel * label;

@end

@implementation BottomMineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView * imageView = [[UIImageView alloc] init];
        
        imageView.image = [UIImage imageNamed:@"Lock"];
        
        self.imageFView = imageView;
        
        [self addSubview:imageView];
        
        __weak __typeof(&*self)ws = self;
        
        CGFloat wh = IphoneSize_Width(28);
        
        CGFloat min = IphoneSize_Width(18);
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.width.offset(wh);
            
            make.height.offset(wh);
            
            make.left.equalTo(ws.mas_left).offset(min);
            
            make.centerY.equalTo(ws.mas_centerY);
            
        }];
        
        UILabel * label = [[UILabel alloc] init];
        
        label.text = @"我的借款";
        
        label.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
        
        label.textColor = [UIColor colorWithHexString:@"#666666"];
        
        [self addSubview:label];
        
        self.label = label;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(imageView.mas_right).offset(IphoneSize_Width(18));
            
            make.centerY.equalTo(imageView.mas_centerY);
            
        }];
    }
    
    return self;
}

- (void)setItem:(BottomCellItem *)item{
    
    //设置图片
    self.imageFView.image = [UIImage imageNamed:item.image];
    
    //设置label
    self.label.text = item.title;
}

@end
