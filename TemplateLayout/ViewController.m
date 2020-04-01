//
//  ViewController.m
//  TemplateLayout
//
//  Created by 哈哈 on 2020/3/28.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "ViewController.h"
#import "templateCell.h"
#import "templateModel.h"
#import "pictureViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ViewController

#pragma mark init
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    
    return _dataArray;
}

#pragma mark view clyle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feedDicts = rootDict[@"feed"];
    [feedDicts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        templateModel *model = [[templateModel alloc] initWithDictionary:obj];
        [self.dataArray addObject:model];
    }];
    
    [self.tableView reloadData];

}


#pragma mark UITableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    templateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"templateCell"];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[pictureViewController new] animated:YES];
}



@end
