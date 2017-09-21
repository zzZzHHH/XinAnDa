//
//  TopView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "TopView.h"

@interface TopView ()

@property (nonatomic,strong)NSMutableArray *imageArray;

@property (nonatomic,strong)NSMutableArray *lineArray;

@property (nonatomic,strong)NSMutableArray *labelArray;

@end

@implementation TopView

- (NSMutableArray *)imageArray
{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

- (NSMutableArray *)lineArray
{
    if (!_lineArray) {
        _lineArray = [NSMutableArray array];
    }
    return _lineArray;
}

- (NSMutableArray *)labelArray
{
    if (!_labelArray) {
        _labelArray = [NSMutableArray array];
    }
    return _labelArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    NSString * labelArray[] = {@"实名认证",@"银行卡认证",@"设置交易密码"};
    
    NSString * imageArray[] = {@"Icon",@"Card",@"Lock"};

    if (self = [super initWithFrame:frame]) {
     
        for (int i = 0 ; i < 3; i ++) {
            
            CGFloat w = IphoneSize_Width(62);
            
            UIImageView * imageView = [[UIImageView alloc] init];
            
            imageView.layer.cornerRadius = w/2;
            
            imageView.layer.borderWidth = IphoneSize_Width(2.0);
        
            imageView.contentMode = UIViewContentModeCenter;
            
            imageView.image = [UIImage imageNamed:imageArray[i]];
            
            imageView.clipsToBounds = YES;
            
            imageView.backgroundColor = [UIColor whiteColor];
            
            [self addSubview:imageView];
            
            __weak __typeof(&*self)ws = self;

            CGFloat min = (ScreenW - 3 * w)/6;
            
            [self.imageArray addObject:imageView];
            
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.offset(w);
                
                make.height.offset(w);
                
                make.left.equalTo(ws.mas_left).offset(min*(2*i + 1) + w * i);
                
                make.bottom.equalTo(ws.mas_bottom);
                
            }];
            
            UILabel * label = [[UILabel alloc] init];
            
            label.text = labelArray[i];
            
            label.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
            
            label.textColor = [UIColor colorWithHexString:@"#666666"];
            
            [self addSubview:label];
            
            [self.labelArray addObject:label];
            
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.centerX.equalTo(imageView.mas_centerX);
                
                make.top.equalTo(imageView.mas_bottom).offset(IphoneSize_Height(9));
            }];
            
            if (i < 2) {
                
            UIView * view = [[UIView alloc] init];
            
            [self addSubview:view];
                
            [self.lineArray addObject:view];
                
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.width.offset(min * 2);
                
                make.height.offset(IphoneSize_Height(2));
                
                make.left.equalTo(imageView.mas_right);
                
                make.centerY.equalTo(imageView.mas_centerY);
                
            }];
            }
        }
        
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.imageArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIImageView * imageView = self.imageArray[idx];
        
        if ([self.intImageArray[idx] isEqual:@1]){
            
            imageView.layer.borderColor = [UIColor colorWithHexString:@"#1e78ff"].CGColor;
        } else {
            
            imageView.layer.borderColor = [UIColor colorWithHexString:@"#e8f1ff"].CGColor;
        }
        
    }];
    
    [self.lineArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIView * lineView = self.lineArray[idx];
        
        if ([self.intLineArray[idx] isEqual:@1]){
            
            lineView.backgroundColor = [UIColor colorWithHexString:@"#1e78ff"];
        } else {
            
            lineView.backgroundColor = [UIColor colorWithHexString:@"#e8f1ff"];
        }
    }];
    
    
}

@end
