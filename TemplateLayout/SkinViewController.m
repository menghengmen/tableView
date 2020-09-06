//
//  SkinViewController.m
//  TemplateLayout
//
//  Created by 哈哈 on 2020/7/2.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "SkinViewController.h"
#import "ChangeSkinListCell.h"

#define IOS_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define IOS_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define kChangeSkinCollectionViewCell @"kChangeSkinCollectionViewCell"


@interface SkinViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,ChangeSkinListCellDelegate>
@property (nonatomic,strong)  UICollectionView *collectionView;
@end

@implementation SkinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChangeSkinListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kChangeSkinCollectionViewCell forIndexPath:indexPath];
    SkinInfo *info = [[SkinInfo alloc] init];
    info.head = @"timg2.jpg";
    [cell setCellContentWithSkinInfo:info];
    cell.delegate = self;
    return cell;
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 2;
        layout. minimumInteritemSpacing  = 2;
        layout.itemSize = CGSizeMake((IOS_SCREEN_WIDTH - 6) / 2, 247);
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, IOS_SCREEN_WIDTH, IOS_SCREEN_HEIGHT - 64) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerClass:[ChangeSkinListCell class] forCellWithReuseIdentifier:kChangeSkinCollectionViewCell];
    }
    return _collectionView;
}

@end
