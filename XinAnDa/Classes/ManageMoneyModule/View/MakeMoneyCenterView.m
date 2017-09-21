//
//  MakeMoneyCenterView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MakeMoneyCenterView.h"

@interface MakeMoneyCenterView()

@property (nonatomic,weak)UIView * leftView;

@property (nonatomic,weak)UIView * centerView;

@property (nonatomic,weak)UIView * rightView;

@property (nonatomic,weak)UIView * lineViewLeft;

@property (nonatomic,weak)UIView * lineViewRight;

@end

@implementation MakeMoneyCenterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIView * leftView = [self setUpViewWithTitle:@"预计起息" Date:@"2017-05-25"];
        
        self.leftView = leftView;
        
        [self addSubview:leftView];
        
        UIView * centerView = [self setUpViewWithTitle:@"月回款日" Date:@"每月13日"];
        
        self.centerView = centerView;
        
        [self addSubview:centerView];
        
        UIView * rightView = [self setUpViewWithTitle:@"预计到期" Date:@"2017-09-05"];
        
        self.rightView = rightView;
        
        [self addSubview:rightView];
        
        UIView * lineViewLeft = [[UIView alloc] init];
        
        lineViewLeft.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        
        self.lineViewLeft = lineViewLeft;
        
        [self addSubview:lineViewLeft];
        
        UIView * lineViewRight = [[UIView alloc] init];
        
        lineViewRight.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        
        self.lineViewRight = lineViewRight;
        
        [self addSubview:lineViewRight];

    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat min = IphoneSize_Width(15);
    
    CGFloat w = (ScreenW - min*2)/3;
    
    __weak __typeof(&*self)ws = self;

    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(min));
        
        make.centerY.equalTo(ws.mas_centerY);
        
        make.height.offset(IphoneSize_Height(45));
        
        make.width.offset(w);
    }];
    
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(min)+w);
        
        make.centerY.equalTo(ws.mas_centerY);
        
        make.height.offset(IphoneSize_Height(45));
        
        make.width.offset(w);
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(15) + 2*w);
        
        make.centerY.equalTo(ws.mas_centerY);
        
        make.height.offset(IphoneSize_Height(45));
        
        make.width.offset(w);
    }];
    
    [self.lineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.leftView.mas_right);
        
        make.centerY.equalTo(ws.leftView.mas_centerY);
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(44));
    }];
    
    [self.lineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.centerView.mas_right);
        
        make.centerY.equalTo(ws.centerView.mas_centerY);
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(44));
    }];

}

- (UIView *)setUpViewWithTitle:(NSString *)title Date:(NSString *)date{
    
    UIView * view = [[UIView alloc] init];
    
    UILabel * topLabel = [self labelWithTitle:title Font:IphoneSize_Font(14) Color:@"#999999"];
    
    [view addSubview:topLabel];
    
    UILabel * bottomLabel = [self labelWithTitle:date Font:IphoneSize_Font(15) Color:@"#333333"];
    
    [view addSubview:bottomLabel];
    
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view.mas_top);
        
        make.centerX.equalTo(view.mas_centerX);
        
    }];
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(view.mas_bottom);
        
        make.centerX.equalTo(view.mas_centerX);
        
    }];
    
    return view;
}

- (UILabel *)labelWithTitle:(NSString *)title Font:(CGFloat)font Color:(NSString *)color{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = title;
    
    label.textColor = [UIColor colorWithHexString:color];
    
    label.font = [UIFont systemFontOfSize:font];
    
    return label;
}
@end
