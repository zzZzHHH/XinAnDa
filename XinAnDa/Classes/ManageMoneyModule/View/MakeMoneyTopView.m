//
//  MakeMoneyTopView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MakeMoneyTopView.h"

@interface MakeMoneyTopView()

@property (nonatomic,weak)UILabel *topLabel;

@property (nonatomic,weak)UILabel *bottomLabel;

@property (nonatomic,weak)UIView * leftView;

@property (nonatomic,weak)UIView * centerView;

@property (nonatomic,weak)UIView * rightView;

@end

@implementation MakeMoneyTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {

        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackGround"]]];
        
        UILabel * topLabel = [[UILabel alloc] init];
        
        topLabel.text = @"6.1";
        
        topLabel.textColor = [UIColor whiteColor];
        
        topLabel.font = [UIFont boldSystemFontOfSize:IphoneSize_Font(52)];
        
        self.topLabel = topLabel;
        
        [self addSubview:topLabel];
        
        UILabel * bottomLabel = [[UILabel alloc] init];
        
        bottomLabel.text = @"预期年化收益率";
        
        bottomLabel.textColor = [UIColor whiteColor];
        
        bottomLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
        
        self.bottomLabel = bottomLabel;
        
        [self addSubview:bottomLabel];
        
        UIView * leftView = [self setUpViewWithTitle:@"投资期限" Date:@"3个月"];
        
        self.leftView = leftView;
        
        [self addSubview:leftView];
        
        UIView * centerView = [self setUpViewWithTitle:@"投资期限(元)" Date:@"93250"];
        
        self.centerView = centerView;
        
        [self addSubview:centerView];
        
        UIView * rightView = [self setUpViewWithTitle:@"项目总额(元)" Date:@"93450"];
        
        self.rightView = rightView;
        
        [self addSubview:rightView];
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    __weak __typeof(&*self)ws = self;
    
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(ws.mas_centerX);
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(90));
    }];
    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(ws.topLabel.mas_centerX);
        
        make.top.equalTo(ws.topLabel.mas_bottom);
    }];
    
    CGFloat min = IphoneSize_Width(15);
    
    CGFloat w = (ScreenW - min*2)/3;
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(min));
        
        make.top.equalTo(ws.bottomLabel.mas_bottom).offset(IphoneSize_Height(56));
        
        make.bottom.equalTo(ws.mas_bottom).offset(IphoneSize_Height(-19));
        
        make.width.offset(w);
    }];
    
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(min)+w);
        
        make.top.equalTo(self.leftView.mas_top);
        
        make.bottom.equalTo(self.leftView.mas_bottom);
        
        make.width.offset(w);
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(15) + 2*w);
        
        make.top.equalTo(self.leftView.mas_top);
        
        make.bottom.equalTo(self.leftView.mas_bottom);
        
        make.width.offset(w);
    }];
}

- (UIView *)setUpViewWithTitle:(NSString *)title Date:(NSString *)date{
    
    UIView * view = [[UIView alloc] init];
    
    UILabel * topLabel = [self labelWithTitle:date Font:IphoneSize_Font(20) Color:@"#ffffff"];
    
    [view addSubview:topLabel];
    
    UILabel * bottomLabel = [self labelWithTitle:title Font:IphoneSize_Font(14) Color:@"#ffffff"];
    
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
