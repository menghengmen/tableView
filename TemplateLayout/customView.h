//
//  customView.h
//  TemplateLayout
//
//  Created by 哈哈 on 2020/4/1.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface customView : UIView
-(instancetype)initWithFrame:(CGRect)frame withData:(NSMutableArray*)dataArr;
@property (nonatomic,strong)  UIView *backgroundView; //背景
@property (nonatomic,assign)  BOOL resultIsOn; // 是否展示识别结果
@property (nonatomic,strong)  NSString *scanStr;


@end

NS_ASSUME_NONNULL_END
