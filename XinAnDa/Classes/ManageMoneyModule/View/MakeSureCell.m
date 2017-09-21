//
//  MakeSureCell.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/10.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MakeSureCell.h"

@interface MakeSureCell()

@property (nonatomic,weak)UIView * oneView;

@property (nonatomic,weak)UIView * twoView;

@property (nonatomic,weak)UIView * threeView;

@property (nonatomic,weak)UILabel * titleLabel;

@property (nonatomic,weak)UILabel * dateLabel;

@property (nonatomic,weak)UILabel * noUseLabel;

@property (nonatomic,weak)UIView * lineViewLeft;

@property (nonatomic,weak)UIView * lineViewRight;

@end

@implementation MakeSureCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView * oneView = [self setUpViewWithTag:1 Title:@"投资本金" Money:@"2000" Font:IphoneSize_Font(18) Color:@"#1e78ff"];
        
        self.oneView = oneView;
        
        [self addSubview:oneView];
        
        UIView * twoView = [self setUpViewWithTag:2 Title:@"投资期限" Money:@"3个月"Font:IphoneSize_Font(15) Color:@"#333333"];
        
        self.twoView = twoView;
        
        [self addSubview:twoView];
        
        UIView * threeView = [self setUpViewWithTag:3 Title:@"应收利息" Money:@"100.23" Font:IphoneSize_Font(18) Color:@"#1e78ff"];
        
        self.threeView = threeView;
        
        [self addSubview:threeView];
        
        UILabel * titleLabel = [self labelWithTitle:@"金元宝3个月" Font:IphoneSize_Font(16) Color:@"#333333"];
        
        self.titleLabel = titleLabel;
        
        [self addSubview:titleLabel];
        
        UILabel * noUseLabel = [self labelWithTitle:@"到期" Font:IphoneSize_Font(14) Color:@"#666666"];
        
        self.noUseLabel = noUseLabel;
        
        [self addSubview:noUseLabel];
        
        UILabel * dateLabel = [self labelWithTitle:@"2017-07-25" Font:IphoneSize_Font(14) Color:@"#ff7979"];
        
        self.dateLabel = dateLabel;
        
        [self addSubview:dateLabel];

        UIButton * lendBtn = [self setUpBtn];
        
        lendBtn.hidden = YES;
        
        self.lendBtn = lendBtn;
        
        [self addSubview:lendBtn];
        
        UILabel * lendLabel = [self labelWithTitle:@"" Font:IphoneSize_Font(14) Color:@"#666666"];
        
        self.lendLabel = lendLabel;
        
        [self addSubview:lendLabel];
        
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

- (UIButton *)setUpBtn{
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:@"转" forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
    
    btn.layer.cornerRadius = IphoneSize_Width(14);

    [btn setBackgroundColor:[UIColor colorWithHexString:@"#ff7979"]];
    
    return btn;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    __weak __typeof(&*self)ws = self;
    
    CGFloat min = IphoneSize_Width(15);
    
    CGFloat w = (ScreenW - min*2)/3;
    
    [self.oneView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(min));
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(58));
        
        make.bottom.equalTo(ws.mas_bottom).offset(IphoneSize_Height(-38));
        
        make.width.offset(w);
    }];
    
    [self.twoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(min)+w);
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(58));
        
        make.bottom.equalTo(ws.mas_bottom).offset(IphoneSize_Height(-38));
        
        make.width.offset(w);
    }];
    
    [self.threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(15) + 2*w);
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(58));
        
        make.bottom.equalTo(ws.mas_bottom).offset(IphoneSize_Height(-38));
        
        make.width.offset(w);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(15));
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(24));
        
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(ws.mas_right).offset(IphoneSize_Width(-15));
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(24));
        
    }];
    
    [self.noUseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.dateLabel.mas_left);
        
        make.top.equalTo(self.dateLabel.mas_top);
        
    }];
    
    [self.lendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.dateLabel.mas_right);
        
        make.top.equalTo(self.threeView.mas_bottom).offset(IphoneSize_Height(5));
        
        make.width.offset(IphoneSize_Width(45));
        
        make.height.offset(IphoneSize_Height(28));
        
    }];
    
    [self.lendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.oneView.mas_left);
        
        make.top.equalTo(self.oneView.mas_bottom).offset(IphoneSize_Height(5));
        
    }];
    
    [self.lineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.oneView.mas_right);
        
        make.centerY.equalTo(self.oneView.mas_centerY);
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(30));
    }];
    
    [self.lineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.twoView.mas_right);
        
        make.centerY.equalTo(self.oneView.mas_centerY);
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(30));
    }];
}

- (UIView *)setUpViewWithTag:(int)tag Title:(NSString *)title Money:(NSString *)money Font:(CGFloat)font Color:(NSString *)color{
    
    UIView * view = [[UIView alloc] init];
    
    UILabel * topLabel = [self labelWithTitle:title Font:IphoneSize_Font(14) Color:@"#666666"];
    
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
            
            make.bottom.equalTo(view.mas_bottom);
            
            make.centerX.equalTo(view.mas_centerX);
            
        }];
        
    }else if (tag == 3){
        
        [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(view.mas_top);
            
            make.right.equalTo(view.mas_right);
            
        }];
        [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(view.mas_bottom);
            
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

-(void)setFrame:(CGRect)frame{
    
    frame.size.height -= IphoneSize_Height(2);
    
    [super setFrame:frame];
}
@end
