//
//  MiddleView.m
//  XinAnDa
//
//  Created by 周立贺 on 17/7/3.
//  Copyright © 2017年 周立贺. All rights reserved.
//

#import "MiddleView.h"

@interface MiddleView ()

@end

@implementation MiddleView

- (NSMutableArray *)labelArray
{
    if (!_labelArray) {
        _labelArray = [NSMutableArray array];
    }
    return _labelArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        NSString * labelArray[] = {@"请输入真实姓名",@"请输入身份证号"};
        
        NSString * labelText = @"这是您首次投资51人品，为确保资金安全，请先完成实名认证。";
        
        for (int i = 0; i < 2; i ++) {

            UITextField * textField = [[UITextField alloc] init];
            
            textField.placeholder = labelArray[i];
            
            textField.font = [UIFont systemFontOfSize:IphoneSize_Font(15)];
            
            switch (i) {
                case 0:
                    self.tfOne = textField;
                    break;
                case 1:
                    self.tfTwo = textField;
                    break;
                default:
                    break;
            }
            
            [self addSubview:textField];
            
            [self.labelArray addObject:textField];
            
            __weak __typeof(&*self)ws = self;
            
            CGFloat h = IphoneSize_Height(50);
            
            [textField mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.left.equalTo(ws.mas_left).offset(IphoneSize_Width(15));
                
                make.right.equalTo(ws.mas_right).offset(IphoneSize_Width(-15));
                
                make.height.offset(h);
                
                make.top.equalTo(ws.mas_top).offset(h * i);
                
            }];
            
            if (i == 0) {
            
            UIView * lineView = [[UIView alloc] init];
            
            lineView.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
            
            [self addSubview:lineView];
                
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
               
                make.left.equalTo(textField.mas_left);
                
                make.right.equalTo(textField.mas_right);
                
                make.height.offset(IphoneSize_Height(1));
                
                make.bottom.equalTo(textField.mas_bottom);
                
            }];
            }
            if (i == 1){
                
                UILabel * label = [[UILabel alloc] init];
                
                label.text = labelText;
                
                label.textColor = [UIColor colorWithHexString:@"#666666"];
                
                label.numberOfLines = 0;
                
                label.font = [UIFont systemFontOfSize:IphoneSize_Font(14)];
                
                self.label = label;
                
                [self addSubview:label];
                
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    
                    make.left.equalTo(textField.mas_left);
                    
                    make.right.equalTo(textField.mas_right);
                    
                    make.top.equalTo(textField.mas_bottom).offset(IphoneSize_Height(15));
                }];
            }
            
        }
    }
    
    return self;
}
@end
