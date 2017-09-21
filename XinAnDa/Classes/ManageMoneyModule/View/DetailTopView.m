//
//  DetailTopView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "DetailTopView.h"

@interface DetailTopView ()

@property (nonatomic,weak)UIView * oneView;

@property (nonatomic,weak)UIView * twoView;

@property (nonatomic,weak)UIView * threeView;

@property (nonatomic,weak)UILabel * titleLabel;

@property (nonatomic,weak)UIView * lineViewLeft;

@property (nonatomic,weak)UIView * lineViewRight;

@end

@implementation DetailTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIView * oneView = [self setUpViewWithTag:1 Title:@"预期年化" Money:@"7.00%" Font:IphoneSize_Font(20) Color:@"#ff7979"];
        
        self.oneView = oneView;
        
        [self addSubview:oneView];
        
        UIView * twoView = [self setUpViewWithTag:2 Title:@"投资期限" Money:@"3个月"Font:IphoneSize_Font(14) Color:@"#333333"];
        
        self.twoView = twoView;
        
        [self addSubview:twoView];
        
        UIView * threeView = [self setUpViewWithTag:3 Title:@"还款方式" Money:@"等额本息" Font:IphoneSize_Font(14) Color:@"#333333"];
        
        self.threeView = threeView;
        
        [self addSubview:threeView];
        
        UILabel * titleLabel = [self labelWithTitle:@"金元宝定期3个月内" Font:IphoneSize_Font(15) Color:@"#333333"];
        
        self.titleLabel = titleLabel;
        
        [self addSubview:titleLabel];
        
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
    
    __weak __typeof(&*self)ws = self;
    
    CGFloat min = IphoneSize_Width(15);
    
    CGFloat w = (ScreenW - min*2)/3;
    
    [self.oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(min));
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(50));
        
        make.bottom.equalTo(ws.mas_bottom).offset(IphoneSize_Height(-20));
        
        make.width.offset(w);
    }];
     
    [self.twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(min)+w);
        
        make.top.equalTo(ws.oneView.mas_top);
        
        make.bottom.equalTo(ws.oneView.mas_bottom);
        
        make.width.offset(w);
    }];
    
    [self.threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(min + 2*w);
        
        make.top.equalTo(ws.oneView.mas_top);
        
        make.bottom.equalTo(ws.oneView.mas_bottom);
        
        make.width.offset(w);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(min);
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(14));
        
    }];
    
    [self.lineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.oneView.mas_right);
        
        make.centerY.equalTo(ws.oneView.mas_centerY);
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(30));
    }];
    
    [self.lineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.twoView.mas_right);
        
        make.centerY.equalTo(ws.oneView.mas_centerY);
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(30));
    }];
}

- (UIView *)setUpViewWithTag:(int)tag Title:(NSString *)title Money:(NSString *)money Font:(CGFloat)font Color:(NSString *)color{
    
    UIView * view = [[UIView alloc] init];
    
    UILabel * topLabel = [self labelWithTitle:title Font:IphoneSize_Font(13) Color:@"#999999"];
    
    [view addSubview:topLabel];
    
    UILabel * bottomLabel = [self labelWithTitle:money Font:IphoneSize_Font(font) Color:color];
    
    [view addSubview:bottomLabel];
    
    if (tag == 1){
        
        [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(view.mas_top);
            
            make.left.equalTo(view.mas_left);
            
        }];
        
        [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(view.mas_bottom);
            
            make.left.equalTo(view.mas_left);
            
        }];
        
    }else if (tag == 2){
        
        [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(view.mas_top);
            
            make.centerX.equalTo(view.mas_centerX);
            
        }];
        [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(view.mas_bottom).offset(IphoneSize_Width(-2));
            
            make.centerX.equalTo(view.mas_centerX);
            
        }];
        
    }else if (tag == 3){
        
        [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(view.mas_top);
            
            make.right.equalTo(view.mas_right);
            
        }];
        [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(view.mas_bottom).offset(IphoneSize_Width(-2));
            
            make.right.equalTo(view.mas_right);
            
        }];
    }
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
