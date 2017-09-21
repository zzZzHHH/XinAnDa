//
//  SubBottomView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/10.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SubBottomView.h"

@interface SubBottomView()

@property (nonatomic,weak)UIView *oneView;

@property (nonatomic,weak)UIView *twoView;

@property (nonatomic,weak)UIView *lineView;

@end

@implementation SubBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        
        self.layer.shadowOpacity =IphoneSize_Width(0.2f) ;
        
        self.layer.shadowRadius = IphoneSize_Width(4.f);
        
        self.layer.shadowOffset = CGSizeMake(IphoneSize_Width(1),IphoneSize_Height(1));
        
        self.layer.cornerRadius = IphoneSize_Width(5.0);
        
        UIView * oneView = [self setUpViewWithTitle:@"当前资产(元)" Money:@"1100.42"];
        
        self.oneView = oneView;
        
        [self addSubview:oneView];
        
        UIView * twoView = [self setUpViewWithTitle:@"历史收益(元)" Money:@"100.42"];
        
        self.twoView = twoView;
        
        [self addSubview:twoView];
        
        UIView * lineView = [[UIView alloc] init];
        
        lineView.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        
        self.lineView = lineView;
        
        [self addSubview:lineView];
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    __weak __typeof(&*self)ws = self;
    
    [self.oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left);
        
        make.top.equalTo(ws.mas_top);
        
        make.bottom.equalTo(ws.mas_bottom);
        
        make.width.offset(ws.ZLHW/2);
        
    }];

    [self.twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(ws.ZLHW/2);
        
        make.top.equalTo(ws.mas_top);
        
        make.bottom.equalTo(ws.mas_bottom);
        
        make.width.offset(ws.ZLHW/2);
        
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.offset(IphoneSize_Width(0.5));
        
        make.height.offset(IphoneSize_Height(45));
        
        make.centerX.equalTo(ws.mas_centerX);
        
        make.centerY.equalTo(ws.mas_centerY);
        
    }];
}

- (UIView *)setUpViewWithTitle:(NSString *)title Money:(NSString *)money{
    
    UIView * view = [[UIView alloc] init];
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = title;
    
    label.textColor = [UIColor colorWithHexString:@"#666666"];
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    [view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(view.mas_left).offset(IphoneSize_Width(47));
        
        make.top.equalTo(view.mas_top).offset(IphoneSize_Height(20));
        
    }];
    
    UILabel * twoLabel = [[UILabel alloc] init];
    
    twoLabel.text = money;
    
    twoLabel.textColor = [UIColor colorWithHexString:@"#1e78ff"];
    
    twoLabel.font = [UIFont boldSystemFontOfSize:IphoneSize_Font(26)];
    
    [view addSubview:twoLabel];
    
    [twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(label.mas_centerX);
        
        make.top.equalTo(label.mas_bottom).offset(IphoneSize_Height(10));
    }];
    
    return view;
}

@end
