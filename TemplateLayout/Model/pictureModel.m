//
//  pictureModel.m
//  TemplateLayout
//
//  Created by 哈哈 on 2020/4/1.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "pictureModel.h"

@implementation pictureModel


+ (NSArray *)getData:(NSString *)fileName {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:fileName ofType:nil]];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *resultArr = [pictureModel mj_objectArrayWithKeyValuesArray:array];
    
    return resultArr;
}
@end
