//
//  DetailCenterTopView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "DetailCenterTopView.h"

@interface DetailCenterTopView()

@property (nonatomic,weak)UIView *oneView;

@property (nonatomic,weak)UIView *twoView;

@property (nonatomic,weak)UIView *threeView;

@property (nonatomic,weak)UIView *fourView;

@property (nonatomic,weak)UIView *lineViewTop;

@property (nonatomic,weak)UIView *lineViewBottom;

@property (nonatomic,weak)UIView *lineViewCenter;

@end

@implementation DetailCenterTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIView * oneView = [self setUpViewWithTitle:@"投资本金(元)" Money:@"2000" Color:@"#1e78ff" Font:IphoneSize_Font(20)];
        
        self.oneView = oneView;
        
        [self addSubview:oneView];
        
        UIView * twoView = [self setUpViewWithTitle:@"应收利息" Money:@"100.32"Color:@"#1e78ff" Font:IphoneSize_Font(20)];
        
        self.twoView = twoView;
        
        [self addSubview:twoView];
        
        UIView * threeView = [self setUpViewWithTitle:@"起息时间" Money:@"2017-04-25" Color:@"#333333" Font:IphoneSize_Font(14)];
        
        self.threeView = threeView;
        
        [self addSubview:threeView];
        
        UIView * fourView = [self setUpViewWithTitle:@"到期时间" Money:@"2017-07-25" Color:@"#333333" Font:IphoneSize_Font(14)];
        
        self.fourView = fourView;
        
        [self addSubview:fourView];
        
        UIView * lineViewTop= [[UIView alloc] init];
        
        lineViewTop.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        
        self.lineViewTop = lineViewTop;
        
        [self addSubview:lineViewTop];
        
        UIView * lineViewBottom = [[UIView alloc] init];
        
        lineViewBottom.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        
        self.lineViewBottom = lineViewBottom;
        
        [self addSubview:lineViewBottom];
        
        UIView * lineViewCenter = [[UIView alloc] init];
        
        lineViewCenter.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        
        self.lineViewCenter = lineViewCenter;
        
        [self addSubview:lineViewCenter];
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    __weak __typeof(&*self)ws = self;
    
    [self.oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left);
        
        make.top.equalTo(ws.mas_top);
        
        make.height.offset(ws.ZLHH/2);
        
        make.width.offset(ws.ZLHW/2);
        
    }];
    
    [self.twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(ws.ZLHW/2);
        
        make.top.equalTo(ws.mas_top);
        
        make.height.offset(ws.ZLHH/2);
        
        make.width.offset(ws.ZLHW/2);
    }];
    
    [self.threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left);
        
        make.top.equalTo(ws.mas_top).offset(ws.ZLHH/2);
        
        make.height.offset(ws.ZLHH/2);
        
        make.width.offset(ws.ZLHW/2);
    }];
    
    [self.fourView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(ws.ZLHW/2);
        
        make.top.equalTo(ws.mas_top).offset(ws.ZLHH/2);
        
        make.height.offset(ws.ZLHH/2);
        
        make.width.offset(ws.ZLHW/2);
    }];
    
    
    [self.lineViewTop mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.oneView.mas_right);
        
        make.centerY.equalTo(ws.oneView.mas_centerY);
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(45));
    }];
    
    [self.lineViewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.threeView.mas_right);
        
        make.centerY.equalTo(ws.threeView.mas_centerY);
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(45));
    }];
    
    [self.lineViewCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(ws.oneView.mas_bottom);
        
        make.centerX.equalTo(ws.mas_centerX);
        
        make.height.offset(IphoneSize_Height(1));
        
        make.width.offset(IphoneSize_Width(345));
    }];
}

- (UIView *)setUpViewWithTitle:(NSString *)title Money:(NSString *)money Color:(NSString *)color Font:(CGFloat)font{
    
    UIView * view = [[UIView alloc] init];
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = title;
    
    label.textColor = [UIColor colorWithHexString:@"#999999"];
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(13)];
    
    [view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(view.mas_centerX);
        
        make.top.equalTo(view.mas_top).offset(IphoneSize_Height(20));
        
    }];
    
    UILabel * twoLabel = [[UILabel alloc] init];
    
    twoLabel.text = money;
    
    twoLabel.textColor = [UIColor colorWithHexString:color];
    
    twoLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(font)];
    
    [view addSubview:twoLabel];
    
    [twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(label.mas_centerX);
        
        make.top.equalTo(label.mas_bottom).offset(IphoneSize_Height(10));
    }];
    
    return view;
}

@end
