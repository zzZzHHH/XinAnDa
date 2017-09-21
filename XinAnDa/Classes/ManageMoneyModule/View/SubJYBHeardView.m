//
//  SubJYBHeardView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/10.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SubJYBHeardView.h"

@implementation SubJYBHeardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UILabel * label = [[UILabel alloc] init];
        
        label.text = @"项目详情";
        
        label.textColor = [UIColor colorWithHexString:@"#333333"];
        
        label.font = [UIFont boldSystemFontOfSize:IphoneSize_Font(16)];
        
        self.label = label;
        
        [self addSubview:label];
        
        __weak __typeof(&*self)ws = self;

        [label mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(14));
            
            make.centerY.equalTo(ws.mas_centerY);
        }];
        
        UIView * lineView = [[UIView alloc] init];
        
        lineView.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        
        [self addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(14));
            
            make.width.offset(ScreenW - IphoneSize_Width(28));
            
            make.height.offset(IphoneSize_Height(1));
            
            make.bottom.equalTo(ws.mas_bottom);
        }];
    }
    return self;
}

@end
