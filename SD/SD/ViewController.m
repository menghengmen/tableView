//
//  ViewController.m
//  SD
//
//  Created by 哈哈 on 2022/7/21.
//  Copyright © 2022 MengHeng. All rights reserved.
//

#import "ViewController.h"
#import <YYWebImage.h>

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *icon;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.icon.yy_imageURL = [NSURL URLWithString:@""];

}

@end
