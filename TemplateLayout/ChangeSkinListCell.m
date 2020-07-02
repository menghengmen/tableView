//
//  ChangeSkinListCell.m
//  SuningEIM
//
//  Created by chenlansheng on 17/03/20.
//  Copyright (c) 2017年 suning. All rights reserved.
//

#import "ChangeSkinListCell.h"

@implementation SkinInfo
@end

@interface ChangeSkinListCell ()
@property (strong, nonatomic) UIImageView *headView;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UILabel *selectLabel;
@property (strong, nonatomic) SkinInfo *info;



@end

@implementation ChangeSkinListCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setCellContentWithSkinInfo:(SkinInfo *)info
{
    self.info = info;
    
    //设置头像
    self.headView.image = [UIImage imageNamed:info.head];
    
    //设置描述
    self.infoLabel.text = self.info.color;
    
    //设置选项
    if(self.info.select){
        //self.selectLabel.backgroundColor = RGBA(229, 229, 229, 1);
        self.selectLabel.text = @"已设置";
    }
    else{
        self.selectLabel.backgroundColor = [UIColor clearColor];
        self.selectLabel.text = @"设置";
    }
}

-  (void)selectLabelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    //通知选项变更
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeSkinCellWasClicked:)])
    {
        [self.delegate changeSkinCellWasClicked:self.info];
    }
}

- (UIImageView *)headView{
    if (!_headView) {
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 153)];
        _headView.contentMode = UIViewContentModeScaleAspectFill;
        _headView.clipsToBounds = YES;
        _headView.image = [UIImage imageNamed:@"ting.jpg"];
        [self addSubview:_headView];
//        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(self);
//            make.height.mas_equalTo(153);
//            make.centerX.mas_equalTo(self);
//        }];

    }
    return _headView;
}

//- (UILabel *)infoLabel {
//    if (!_infoLabel) {
//        _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];
//        [self addSubview:_infoLabel];
////        [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.top.mas_equalTo(_headView.mas_bottom).offset(10);
////            make.centerX.mas_equalTo(self);
////        }];
//    }
//    return _infoLabel;
//}

//- (UILabel *)selectLabel{
//    if (!_selectLabel) {
//        _selectLabel = [[UILabel alloc] init];
//        [self addSubview:_selectLabel];
//
//        _selectLabel.layer.borderWidth = 1;
//       // _selectLabel.layer.borderColor = RGBA(221, 221, 221, 1).CGColor;
//        _selectLabel.layer.cornerRadius = 4;
//        _selectLabel.clipsToBounds = YES;
//        _selectLabel.textAlignment = NSTextAlignmentCenter;
//
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectLabelTouchUpInside:)];
//        _selectLabel.userInteractionEnabled = YES;
//        [_selectLabel addGestureRecognizer:tap];
//
//        [_selectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.bottom.mas_equalTo(self).with.offset(-22);
//            make.centerX.mas_equalTo(self);
//            make.size.mas_equalTo(CGSizeMake(69, 34));
//        }];
//    }
//    return _selectLabel;
//}
@end
