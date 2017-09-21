//
//  DetailBottomView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "DetailBottomView.h"

@interface DetailBottomView ()

@property (nonatomic,weak)UIView *topView;

@property (nonatomic,weak)UIView *centerView;

@property (nonatomic,weak)UIView *BottomView;

@property (nonatomic,weak)UIView *lineViewCenter;

@property (nonatomic,weak)UIView *lineViewbottom;

@end

@implementation DetailBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIView * topView = [self setUpViewWithTitle:@"汇款计划"];
        self.topView = topView;
        [self addSubview:topView];
        
        UIView * centerView = [self setUpViewWithTitle:@"项目详情"];
        self.centerView = centerView;
        [self addSubview:centerView];

        UIView * BottomView = [self setUpViewWithTitle:@"项目借款协议"];
        self.BottomView = BottomView;
        [self addSubview:BottomView];
        
        UIView * lineViewCenter = [[UIView alloc] init];
        lineViewCenter.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        self.lineViewCenter = lineViewCenter;
        [self addSubview:lineViewCenter];
        
        UIView * lineViewbottom = [[UIView alloc] init];
        lineViewbottom.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        self.lineViewbottom = lineViewbottom;
        [self addSubview:lineViewbottom];
    }
    return self;
}

- (void)layoutSubviews{
    
    CGFloat h = self.ZLHH/3;
    
    __weak __typeof(&*self)ws = self;

    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(ws.mas_left);
        
        make.top.equalTo(ws.mas_top);
        
        make.width.offset(ScreenW);
        
        make.height.offset(h);
    }];
    
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left);
        
        make.top.equalTo(ws.mas_top).offset(h);
        
        make.width.offset(ScreenW);
        
        make.height.offset(h);
    }];
    
    [self.BottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left);
        
        make.top.equalTo(ws.mas_top).offset(2*h);
        
        make.width.offset(ScreenW);
        
        make.height.offset(h);
    }];
    
    [self.lineViewCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(ws.topView.mas_bottom);
        
        make.centerX.equalTo(ws.mas_centerX);
        
        make.height.offset(IphoneSize_Height(1));
        
        make.width.offset(IphoneSize_Width(345));
    }];
    
    [self.lineViewbottom mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(ws.centerView.mas_bottom);
        
        make.centerX.equalTo(ws.mas_centerX);
        
        make.height.offset(IphoneSize_Height(1));
        
        make.width.offset(IphoneSize_Width(345));
    }];
}

- (UIView *)setUpViewWithTitle:(NSString *)title{
    
    UIView * view = [[UIView alloc] init];
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = title;
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    label.textColor = [UIColor colorWithHexString:@"#333333"];
    
    [view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(view.mas_centerY);
        
        make.left.equalTo(view.mas_left).offset(IphoneSize_Width(15));
    }];
    
    UILabel * rightLabel = [[UILabel alloc] init];
    
    rightLabel.text = @">";
    
    rightLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    rightLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    
    [view addSubview:rightLabel];
    
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(view.mas_centerY);
        
        make.right.equalTo(view.mas_right).offset(IphoneSize_Width(-15));
    }];
    
    return view;
}

@end
