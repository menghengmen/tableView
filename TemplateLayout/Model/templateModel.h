//
//  templateModel.h
//  TemplateLayout
//
//  Created by 哈哈 on 2020/3/28.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface templateModel : NSObject
@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
/**
 获取数据模型数组
 
 @param fileName 文件名
 @return  数据模型数组
 */
+ (NSArray *)getData:(NSString *)fileName;


@end

NS_ASSUME_NONNULL_END
