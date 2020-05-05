//
//  ForumSelectView.m
//  SuningEIM
//
//  Created by MengHeng on 17/9/1.
//  Copyright © 2017年 suning. All rights reserved.
//


#import "ForumSelectView.h"
#import "UIView+Additions.h"
#import "Masonry.h"

#define HORIZONTAL_PADDING 7.0f
#define VERTICAL_PADDING   3.0f
#define LABEL_MARGIN       10.0f
#define BOTTOM_MARGIN      10.0f
#define IOS_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define IOS_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
@interface ForumSelectView()
{
    CGRect _previousFrame;
    int _totalHeight;
    UIButton *_tag;
}
@property (nonatomic,strong) UIScrollView *contentView;
@end

@implementation ForumSelectView
//初始化方法
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self setBtn];
    }
    
    return self;
}

-(void)tap{
    
    [self.backgroundView removeFromSuperview];
    [self removeFromSuperview];
}
//设置分类
-(void)setClassificationArray:(NSArray*)classificationArray withSelectStr:(NSString*)selectStr{
    
    _previousFrame = CGRectMake(0, 70, self.width, 26);
    [classificationArray enumerateObjectsUsingBlock:^(NSString * str, NSUInteger idx, BOOL * _Nonnull stop) {
        [self setupBtnWithNSString:str withSelect:selectStr];
    }];
    
}

//设置 版块数组
- (void)setArrayTagWithLabelArray:(NSArray *)array withSelected:(NSString*)selectStr
{
    //设置frame
    _previousFrame = CGRectMake(0, 150, self.width, 27);
    [array enumerateObjectsUsingBlock:^(NSString*str, NSUInteger idx, BOOL *stop) {
        [self setupBtnWithNSString:str withSelect:selectStr];
    }];
    //设置scrollView contentsize 底部留白20
    self.contentView.contentSize = CGSizeMake(IOS_SCREEN_WIDTH, CGRectGetMaxY(_previousFrame) + 20);
}


- (void)setBtn{
    [self addSubview:self.contentView];
    UILabel*classificationLabel = [UILabel new];
    classificationLabel.text = @"分类";
    classificationLabel.font = [UIFont systemFontOfSize:14];
    classificationLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:classificationLabel];
    [classificationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(classificationLabel.superview.mas_top).offset(82);
        make.left.equalTo(classificationLabel.superview.mas_left).offset(10);
    }];
    UILabel*label = [UILabel new];
    label.text = @"版块";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor grayColor];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.superview.mas_top).offset(156);
        make.left.equalTo(label.superview.mas_left).offset(10);
    }];
    UIButton  * closeBtn = [[UIButton alloc] init];
    [closeBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:closeBtn];
    closeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    closeBtn.layer.cornerRadius = 3;
    [closeBtn setTitle:@"\U0000e69b" forState:UIControlStateNormal];
    closeBtn.titleLabel.font =[UIFont fontWithName:@"" size:20];;
    [closeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(closeBtn.superview.mas_top).offset(35);
        make.left.equalTo(closeBtn.superview.mas_left).offset(4);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
        
    }];
}
//初始化按钮
- (void)setupBtnWithNSString:(NSString *)str  withSelect:selectStr{
    //初始化按钮
    _tag = [UIButton buttonWithType:UIButtonTypeCustom];
    //_tag.frame = CGRectZero;
    if (_MHSignalTagColor) {
        _tag.backgroundColor = _MHSignalTagColor;
    }else {
        _tag.backgroundColor = [UIColor whiteColor];
    }
    //设置内容水平居中
    _tag.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_tag setTitle:str forState:UIControlStateNormal];
    //设置字体的大小
    _tag.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    _tag.layer.cornerRadius = 3.0f;
    _tag.layer.masksToBounds = YES;
    //设置字体的颜色
    [_tag setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _tag.layer.borderWidth = 1;
    _tag.layer.borderColor =[UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1].CGColor;
    //高亮荐字
    if ([_tag.titleLabel.text containsString:@"[荐]"]) {
        NSMutableAttributedString *remind = [[NSMutableAttributedString alloc] initWithString:_tag.titleLabel.text];
        [remind addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,3)];
        [_tag setAttributedTitle:remind forState:UIControlStateNormal];
    }
    
    
    if ([str isEqualToString:selectStr]) {
        _tag.backgroundColor = [UIColor grayColor];
        [_tag setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _tag.layer.borderWidth = 0;

    }
    //设置方法
    if ([_tag.titleLabel.text isEqualToString:@"全部"]||[_tag.titleLabel.text isEqualToString:@"通讯录联系人"]||[_tag.titleLabel.text isEqualToString:@"精华"]||[_tag.titleLabel.text isEqualToString:@"我的"]) {
        [_tag addTarget:self action:@selector(typeClickHandle:) forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        [_tag addTarget:self action:@selector(clickHandle:) forControlEvents:UIControlEventTouchUpInside];
    }
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]};
    CGSize StrSize = [str sizeWithAttributes:attribute];
    StrSize.height = 23;
    StrSize.width  += HORIZONTAL_PADDING * 2;
    StrSize.height += VERTICAL_PADDING *2;
    ///新的 SIZE
    CGRect  NewRect = CGRectZero;
    
    if (_previousFrame.origin.x + _previousFrame.size.width + StrSize.width + LABEL_MARGIN > self.bounds.size.width) {
        
        NewRect.origin = CGPointMake(10, _previousFrame.origin.y + StrSize.height + BOTTOM_MARGIN);
        _totalHeight += StrSize.height + BOTTOM_MARGIN;
    }else {
        NewRect.origin = CGPointMake(_previousFrame.origin.x + _previousFrame.size.width + LABEL_MARGIN, _previousFrame.origin.y);
    }
    NewRect.size = StrSize;
    [_tag setFrame:NewRect];
    _previousFrame = _tag.frame;
    [self.contentView addSubview:_tag];
}

-(void)dismiss{
    if (self.finshBlock) {
        self.finshBlock();
    }
   // self.closeVCBlock();
}


#pragma mark - delegate
- (void)clickHandle:(UIButton *)sender{
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(tagClick:)]) {
        [self.delegate tagClick:sender.titleLabel.text];
    }
    [self dismiss];
}
-(void)typeClickHandle:(UIButton*)sender{
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(typeClick:)]) {
        
        NSInteger type = [@[@"全部",@"通讯录联系人",@"精华",@"我的"] indexOfObject:sender.titleLabel.text];
        
        [self.delegate typeClick:type];
    }
    [self dismiss];
}

#pragma mark - Lazy Init
- (NSMutableArray *)selectNameArray{
    
    if (!_selectNameArray) {
        _selectNameArray = [[NSMutableArray alloc] init];
    }
    
    return _selectNameArray;
}

- (UIScrollView *)contentView{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] init];
        _contentView.frame = CGRectMake(0, 0, IOS_SCREEN_WIDTH, IOS_SCREEN_HEIGHT);
        _contentView.contentSize = CGSizeMake(IOS_SCREEN_WIDTH, IOS_SCREEN_HEIGHT + 1);
        _contentView.showsVerticalScrollIndicator = NO;
        _contentView.showsHorizontalScrollIndicator = NO;
    }
    return _contentView;
}
@end
