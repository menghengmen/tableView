//
//  ChangeSkinListCell.h
//  SuningEIM
//
//  Created by chenlansheng on 17/03/20.
//  Copyright (c) 2017年 suning. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SKIN_GREEN      @"青葱绿"
#define SKIN_BLUE       @"商务蓝"
#define SKIN_WHITE      @"时尚白"
#define SKIN_NEWYEAR    @"新年快乐"

@interface SkinInfo : NSObject
@property (nonatomic, strong) NSString *head;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *plist;
@property (nonatomic) BOOL select;
@end

@protocol ChangeSkinListCellDelegate <NSObject>

- (void)changeSkinCellWasClicked:(SkinInfo*)info;

@end

@interface ChangeSkinListCell : UICollectionViewCell

@property (nonatomic, weak) id<ChangeSkinListCellDelegate> delegate;
- (void)setCellContentWithSkinInfo:(SkinInfo *)info;

@end
