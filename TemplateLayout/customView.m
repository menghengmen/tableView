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
        UIView *view = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5f;
        view.userInteractionEnabled = true;
        [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
        self.backgroundView = view;
        [self addSubview:view];
        
        self.resultIsOn =true;
    }
    
    return  self;
}
 
-(void)tap:(UITapGestureRecognizer*)gesture{
    self.resultIsOn = !self.resultIsOn;
    
}

-(void)setResultIsOn:(BOOL)resultIsOn{
    _resultIsOn = resultIsOn;
    if (resultIsOn ==true) {
        [self show];
    } else {
        [self display];
    }
    
}

-(void)show{
    [UIView animateWithDuration:0.5f animations:^{
        self.backgroundView.alpha = 0.5f;
    
    }];
}

-(void)display{
    [UIView animateWithDuration:0.5f animations:^{
        self.backgroundView.alpha = 0.1f;
    }];
}


//Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
       CGContextRef ctx = UIGraphicsGetCurrentContext();
       
       CGContextAddRect(ctx, CGRectMake(10, 10+64, 150, 100));
       
       [[UIColor colorWithRed:0 green:1 blue:0 alpha:1.0] set];
       
       CGContextStrokePath(ctx);
    
    NSString *str = @"上海彼邻信息科技有限公司";
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    [str drawInRect:CGRectMake(10, 74, 150, 100) withAttributes:attrs];
    self.scanStr = str;
}

@end
