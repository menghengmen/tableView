//
//  pictureModel.h
//  TemplateLayout
//
//  Created by 哈哈 on 2020/4/1.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface pictureModel : NSObject
@property   (nonatomic,copy)  NSString* confidence;
@property   (nonatomic,copy)  NSString* language;
@property   (nonatomic,copy)  NSString* Text;
@property   (nonatomic,strong)   NSArray *coords;

@end

@interface locationModel : NSObject //坐标信息
@property   (nonatomic,copy)  NSString* x;
@property   (nonatomic,copy)  NSString* y;

@end

NS_ASSUME_NONNULL_END
