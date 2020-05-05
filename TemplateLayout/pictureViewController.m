//
//  pictureViewController.m
//  TemplateLayout
//
//  Created by 哈哈 on 2020/4/1.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "pictureViewController.h"
#import "customView.h"
#import "pictureModel.h"
#import "TimerViewController.h"
#import "ScrollViewController.h"


@interface pictureViewController ()

@end

@implementation pictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    customView *view = [[customView alloc] initWithFrame:self.view.bounds withData:@[@"上海比邻信息科技有限公司"]];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;


    
    //    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"addStoreIthatLetterModel.json" ofType:nil]];
    //    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    //    NSMutableArray *locModel = [NSMutableArray new];
    //    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //        pictureModel *model = [pictureModel mj_objectWithKeyValues:(NSDictionary*)obj];
    //
    //
    //        [model.coords enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //           // locationModel *locModel = [locationModel mj_objectWithKeyValues:(NSDictionary*)obj];
    //
    //        }];
    //    }];
        
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[ScrollViewController new] animated:true];
}


@end
