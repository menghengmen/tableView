//
//  templateModel.m
//  TemplateLayout
//
//  Created by 哈哈 on 2020/3/28.
//  Copyright © 2020 MengHeng. All rights reserved.
//

#import "templateModel.h"

@implementation templateModel


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}
@end
