//
//  UIView+Frame.m
//  MakeThingss
//
//  Created by 周立贺 on 16/7/14.
//  Copyright © 2016年 周立贺. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

-(void)setZLHW:(CGFloat)ZLHW{
    
    CGRect frame = self.frame;
    frame.size.width = ZLHW;
    self.frame = frame;
}
- (CGFloat)ZLHW{
    
    return self.frame.size.width;
    
}
-(void)setZLHH:(CGFloat)ZLHH{
    
    CGRect frame = self.frame;
    frame.size.height = ZLHH;
    self.frame = frame;
}
- (CGFloat)ZLHH{
    
    return self.frame.size.height;
}
-(void)setZLHX:(CGFloat)ZLHX{
    
    CGRect frame = self.frame;
    frame.origin.x = ZLHX;
    self.frame = frame;
}
- (CGFloat)ZLHX{
    
    return self.frame.origin.x;
}
-(void)setZLHY:(CGFloat)ZLHY{
    
    CGRect frame = self.frame;
    frame.origin.y = ZLHY;
    self.frame = frame;
}
- (CGFloat)ZLHY{
    
    return self.frame.origin.y;
}

- (void)setZLHCenterX:(CGFloat)ZLHCenterX{
    
    CGPoint center = self.center;
    center.x = ZLHCenterX;
    self.center = center;
}

- (CGFloat)ZLHCenterX{
    
    return self.center.x;
    
}

- (void)setZLHCenterY:(CGFloat)ZLHCenterY{
    
    CGPoint center = self.center;
    center.y = ZLHCenterY;
    self.center = center;
}

- (CGFloat)ZLHCenterY{
    
    return self.center.y;
}
@end
