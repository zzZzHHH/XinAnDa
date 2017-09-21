//
//  SubJYBSecondCell.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/10.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "SubJYBSecondCell.h"

@interface SubJYBSecondCell()

@property (nonatomic,strong)NSMutableArray *viewArray;

@end

@implementation SubJYBSecondCell

- (NSArray *)viewArray{
    
    if (!_viewArray) {
        
        _viewArray = [NSMutableArray array];
        
    }
    return _viewArray;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSString * str[] = {@"本人身份证认证",@"运营商认证",@"通讯录认证",@"信用卡账单"};
        
        for (int i = 0; i < 4; i++) {
            
            UIView * oneView = [self setUpViewWithTitle:str[i]];
            
            oneView.tag = i;
            
            [self addSubview:oneView];
            
            [self.viewArray addObject:oneView];
            
        }
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    __weak __typeof(&*self)ws = self;
    
    [self.viewArray enumerateObjectsUsingBlock:^(UIView*  _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
      
        CGFloat w = ws.ZLHW/2;
        
        CGFloat h = ws.ZLHH/2;
        
        NSInteger clo = view.tag/2;
        
        NSInteger line = view.tag%2;
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(ws.mas_left).offset(line * w);
            
            make.top.equalTo(ws.mas_top).offset(clo * h);
            
            make.height.offset(ws.ZLHH/2);
            
            make.width.offset(ws.ZLHW/2);
        }];
    }];
    
}

- (UIView *)setUpViewWithTitle:(NSString *)title {
    
    UIView * view = [[UIView alloc] init];
    
    CGFloat hw = IphoneSize_Width(16);
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightBtn.selected = false;
    
    [rightBtn addTarget:self action:@selector(rightBtnClickWithBtn:) forControlEvents:UIControlEventTouchDown];
    
    [rightBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateSelected];
    
    [rightBtn setImage:[UIImage imageNamed:@"rightNormal"] forState:UIControlStateNormal];
    
    [view addSubview:rightBtn];

    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.offset(hw);
        
        make.height.offset(hw);
        
        make.left.equalTo(view.mas_left).offset(IphoneSize_Width(14));
        
        make.centerY.equalTo(view.mas_centerY);
    
    }];
    
    UILabel * label = [[UILabel alloc] init];
    
    label.text = title;
    
    label.textColor = [UIColor colorWithHexString:@"#333333"];
    
    label.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
    
    [view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(rightBtn.mas_right).offset(IphoneSize_Width(5));
        
        make.centerY.equalTo(view.mas_centerY);
    }];
    
    return view;
    
}

- (void)rightBtnClickWithBtn:(UIButton *)btn {
    
    btn.selected = !btn.selected;
}
@end
