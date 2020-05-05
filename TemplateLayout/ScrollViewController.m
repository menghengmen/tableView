//
//  ScrollViewController.m
//  TemplateLayout
//
//  Created by 哈哈 on 2020/5/5.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "ScrollViewController.h"
#import "ForumSelectView.h"
#define IOS_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define IOS_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ScrollViewController ()
@property (nonatomic, strong) ForumSelectView *forumSelect;//版块选择弹框

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.forumSelect];
    NSMutableArray *forumArray = [NSMutableArray new];

    for (int i = 0; i < 100; i ++) {
        [forumArray addObject:[NSString stringWithFormat:@"测试%d",i]];

    }
   

    [self.forumSelect setArrayTagWithLabelArray:forumArray withSelected:@"测试0"];
}

#pragma mark - lazy init
-(ForumSelectView*)forumSelect{
    if (!_forumSelect) {
        _forumSelect = [[ForumSelectView alloc] initWithFrame:CGRectMake(0, 0, IOS_SCREEN_WIDTH, IOS_SCREEN_HEIGHT)];
        _forumSelect.delegate = self;
        _forumSelect.backgroundColor =[UIColor whiteColor];
        [self.forumSelect setClassificationArray:@[@"全部",@"通讯录联系人",@"精华",@"我的",@"小豆芽",@"苏宁云商",@"国际米兰",@"测试"] withSelectStr:@""];
        
       
    }
    return _forumSelect;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
