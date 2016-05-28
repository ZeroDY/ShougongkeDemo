//
//  ShijiVCModel.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "ShijiVCModel.h"

@implementation ShijiVCModel


+ (NSDictionary *)objectClassInArray{
    return @{@"topic" : [ShijiTopic class], @"hot" : [ShijiHot class], @"best" : [ShijiBest class]};
}
@end

@implementation ShijiTopic

@end

@implementation ShijiHot

@end


@implementation ShijiBest

@end


