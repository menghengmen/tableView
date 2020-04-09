//
//  TimerViewController.m
//  TemplateLayout
//
//  Created by 哈哈 on 2020/4/8.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSTimer *timer =[ NSTimer timerWithTimeInterval:1.0f repeats:true block:^(NSTimer * _Nonnull timer) {
        NSLog(@"调用了");
    }];
    NSTimer *timer1 =[NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(action:) userInfo:nil repeats:YES];
//    self.timer = timer1;
//
//    [timer1 fire];
    [[NSRunLoop currentRunLoop] addTimer:timer1 forMode:NSRunLoopCommonModes];
}

-(void)action:(NSTimer *)timer{
    NSLog(@"定时器开");
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.timer invalidate];
    self.timer = nil;
}


@end
