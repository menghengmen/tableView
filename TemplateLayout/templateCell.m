//
//  templateCell.m
//  底层原理Demo
//
//  Created by 哈哈 on 2020/3/28.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "templateCell.h"
#import "templateModel.h"

@implementation templateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(templateModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
    self.timeLabel.text = model.time;
    self.userName.text = model.username;
    self.iconImage.image = [UIImage imageNamed:model.imageName];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
