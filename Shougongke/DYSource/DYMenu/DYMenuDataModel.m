//
//  DYMenuDataModel.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYMenuDataModel.h"

@implementation DYMenuDataModel

- (instancetype)initWithTitle:(NSString *)title imgName:(NSString *)name imgUrl:(NSString *)url{
    self = [super init];
    if (self) {
        _title = title;
        _imgUrl = url;
        _imgName = name;
    }
    return self;
}

@end