//
//  TopMainMineView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/5.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "TopMainMineView.h"

@implementation TopMainMineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGround"]]];
        
        UIImageView * imageView = [[UIImageView alloc] init];
        
        imageView.clipsToBounds = YES;
        
        imageView.image = [UIImage imageNamed:@"Icon"];
        
        CGFloat wh = IphoneSize_Width(85);
        
        imageView.layer.borderWidth = IphoneSize_Width(2.0);
        
        imageView.layer.cornerRadius = wh/2;
        
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        
        [self addSubview:imageView];
        
        __weak __typeof(&*self)ws = self;

        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.width.offset(wh);
            
            make.height.offset(wh);
            
            make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(64));
            
            make.centerX.offset(ws.ZLHW/2);
            
        }];
        
        UILabel * label = [[UILabel alloc] init];
        
        label.text = @"Sunshine";
        
        label.font = [UIFont boldSystemFontOfSize:IphoneSize_Font(22)];
        
        label.textColor = [UIColor whiteColor];
        
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.equalTo(imageView.mas_bottom).offset(IphoneSize_Height(18));
            
            make.centerX.equalTo(imageView.mas_centerX);
            
        }];

    }
    return self;
}

@end
