//
//  ForumSelectView.h
//  SuningEIM
//
//  Created by MengHeng on 17/9/1.
//  Copyright © 2017年 suning. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol tagViewClickNameDelegate <NSObject>

-(void)typeClick:(NSInteger)type;
- (void)tagClick:(NSString*)tagTitleStr;

@end

@interface  ForumSelectView: UIView
//底部的黑色背景蒙层
@property (nonatomic,strong) UIView *backgroundView;

@property  (nonatomic,weak)id<tagViewClickNameDelegate>delegate;
@property(nonatomic,strong) NSString*seletedName;
@property(nonatomic,strong)NSMutableArray *selectNameArray;
@property (nonatomic,copy) void(^finshBlock)();
@property (nonatomic, copy) void (^closeVCBlock)();
///设置整个View的背景颜色
@property (nonatomic, copy) UIColor *JCbackgroundColor;


/**
 *  设置单一颜色
 */

@property (nonatomic) UIColor *MHSignalTagColor;
//设置分类
-(void)setClassificationArray:(NSArray*)classificationArray  withSelectStr:(NSString*)selectStr;
//设置版块
- (void)setArrayTagWithLabelArray:(NSArray *)array withSelected:(NSString*)selectStr;

@end
