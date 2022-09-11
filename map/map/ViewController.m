//
//  ViewController.m
//  map
//
//  Created by 哈哈 on 2022/8/8.
//  Copyright © 2022 MengHeng. All rights reserved.
//

#import "ViewController.h"
#import "DDSearchManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[DDSearchManager sharedManager] keyWordsSearch:@"酒店" city:@"南京" returnBlock:^(NSArray<__kindof DDSearchPointAnnotation *> *pointAnnotaions) {
          
          
          for (DDSearchPointAnnotation *annotation in pointAnnotaions) {
              NSLog(@"%@ %@ (%f,%f)",annotation.title,annotation.subtitle,annotation.coordinate.latitude,annotation.coordinate.longitude);
          }

      }];
      
}


@end
