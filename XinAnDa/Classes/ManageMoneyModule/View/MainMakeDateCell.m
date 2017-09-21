//
//  MainMakeDateCell.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/11.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MainMakeDateCell.h"

@interface MainMakeDateCell ()

@property (nonatomic,weak)UIView *leftView;

@property (nonatomic,weak)UIView *rightView;

@property (nonatomic,weak)UIView *lineView;

@property (nonatomic,weak)UIView *titleLabel;

@property (nonatomic,weak)UILabel *preLabel;

@property (nonatomic,weak)UILabel *dateLabel;

@property (nonatomic,weak)UILabel *saleLabel;

@property (nonatomic,weak)UILabel *outSaleLabel;

@end

@implementation MainMakeDateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView * leftView = [self setUpViewWithHiddenLeft:NO Right:YES Sale:YES OutSale:YES];
        
        self.leftView = leftView;
        
        [self addSubview:leftView];
        
        UIView * rightView = [self setUpViewWithHiddenLeft:YES Right:NO Sale:NO OutSale:YES];
        
        self.rightView = rightView;
        
        [self addSubview:rightView];
        
        UIView * lineView = [[UIView alloc] init];
        
        lineView.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
        
        self.lineView = lineView;
        
        [self addSubview:lineView];
        
        UILabel * titleLabel = [self labelWithTitle:@"金元宝定期三个月内" Font:IphoneSize_Font(16) Color:@"#333333"];
        
        self.titleLabel = titleLabel;
        
        [self addSubview:titleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    
    __weak __typeof(&*self)ws = self;

    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.offset(ScreenW/2);
        
        make.height.offset(IphoneSize_Height(60));
        
        make.left.equalTo(ws.mas_left);
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(55));
        
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(ScreenW/2);
        
        make.height.offset(IphoneSize_Height(60));
        
        make.right.equalTo(ws.mas_right);
        
        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(55));
        
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(ws.mas_centerX);
        
        make.centerY.equalTo(self.rightView.mas_centerY);
        
        make.width.offset(IphoneSize_Width(1));
        
        make.height.offset(IphoneSize_Height(50));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(14));

        make.top.equalTo(ws.mas_top).offset(IphoneSize_Height(14));

    }];
}

- (UIView *)setUpViewWithHiddenLeft:(BOOL)left Right:(BOOL)right Sale:(BOOL)sale OutSale:(BOOL)outSale{
    
    UIView * view = [[UIView alloc] init];
    
    [self addSubview:view];
    
    UILabel * titleLabel = [self labelWithTitle:@"预期年化" Font:IphoneSize_Font(14) Color:@"#999999"];
    
    titleLabel.hidden = left;
    
    [view addSubview:titleLabel];
    
    UILabel * preLabel = [self labelWithTitle:@"7.00%" Font:IphoneSize_Font(21) Color:@"#ff7979"];
    
    if (!left){
        
        self.preLabel = preLabel;
    }
    
    preLabel.hidden = left;

    [view addSubview:preLabel];
    
    UILabel * monthLabel = [self labelWithTitle:@"9个月" Font:IphoneSize_Font(15) Color:@"#333333"];
    
    self.dateLabel = monthLabel;
    
    monthLabel.hidden = right;
    
    [view addSubview:monthLabel];
    
    UILabel * saleLabel = [self labelWithTitle:@"在售" Font:IphoneSize_Font(12) Color:@"#1e78ff"];
    
    saleLabel.hidden = sale;
    
    self.saleLabel = saleLabel;
    
    saleLabel.textAlignment  = NSTextAlignmentCenter;
    
    CGFloat w = IphoneSize_Width(48);
    
    CGFloat h = IphoneSize_Width(22);
    
    saleLabel.layer.borderWidth = IphoneSize_Width(1.0);
    
    saleLabel.layer.cornerRadius = h/2;
    
    saleLabel.layer.borderColor= saleLabel.textColor.CGColor;
    
    [view addSubview:saleLabel];
    
    UILabel * outSaleLabel = [self labelWithTitle:@"售完" Font:IphoneSize_Font(11) Color:@"#cccccc"];
    
    self.outSaleLabel = outSaleLabel;
    
    outSaleLabel.hidden = outSale;
    
    outSaleLabel.textAlignment  = NSTextAlignmentCenter;

    outSaleLabel.layer.borderWidth = IphoneSize_Width(1.0);
    
    outSaleLabel.layer.cornerRadius = h/2;
    
    outSaleLabel.layer.borderColor = outSaleLabel.textColor.CGColor;
    
    [view addSubview:outSaleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(view.mas_left).offset(IphoneSize_Width(14));
        
        make.top.equalTo(view.mas_top);
        
    }];
    
    [preLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(titleLabel.mas_left);

        make.top.equalTo(titleLabel.mas_bottom).offset(IphoneSize_Height(18));
        
    }];
    
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(view.mas_top);

        make.left.equalTo(view.mas_left).offset(IphoneSize_Width(48));
    }];
    
    [saleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(monthLabel.mas_centerX);
        
        make.top.equalTo(monthLabel.mas_bottom).offset(IphoneSize_Height(13));
        
        make.width.offset(w);
        
        make.height.offset(h);
    }];
    
    [outSaleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(monthLabel.mas_centerX);
        
        make.top.equalTo(monthLabel.mas_bottom).offset(IphoneSize_Height(13));
        
        make.width.offset(w);
        
        make.height.offset(h);
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

-(void)setFrame:(CGRect)frame{
    
    frame.size.height -= IphoneSize_Height(10);
    
    [super setFrame:frame];
}

- (void)setItem:(MainMakeDateItem *)item{
    
    self.preLabel.text = item.pre;
  
    self.dateLabel.text = item.date;
        
    self.saleLabel.hidden = item.sale;
        
    self.outSaleLabel.hidden = !item.sale;
    
}
@end
