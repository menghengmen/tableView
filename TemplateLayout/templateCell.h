//
//  templateCell.h
//  底层原理Demo
//
//  Created by 哈哈 on 2020/3/28.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class templateModel;
NS_ASSUME_NONNULL_BEGIN

@interface templateCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) templateModel *model;

@end

NS_ASSUME_NONNULL_END
