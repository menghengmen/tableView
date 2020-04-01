//
//  pictureViewController.m
//  TemplateLayout
//
//  Created by 哈哈 on 2020/4/1.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "pictureViewController.h"
#import "customView.h"

@interface pictureViewController ()

@end

@implementation pictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    customView *view = [[customView alloc] initWithFrame:self.view.bounds withData:@[@"1"]];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
    
}



@end
