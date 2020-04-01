//
//  customView.m
//  TemplateLayout
//
//  Created by 哈哈 on 2020/4/1.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "customView.h"

@implementation customView

-(instancetype)initWithFrame:(CGRect)frame withData:(NSMutableArray *)dataArr{
    self = [super initWithFrame:frame];
    
    if (self) {
    
    }
    
    return  self;
}
 //Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
       CGContextRef ctx = UIGraphicsGetCurrentContext();
       
       CGContextAddRect(ctx, CGRectMake(10, 10+64, 150, 100));
       
       [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0] set];
       
       CGContextStrokePath(ctx);
}

@end
