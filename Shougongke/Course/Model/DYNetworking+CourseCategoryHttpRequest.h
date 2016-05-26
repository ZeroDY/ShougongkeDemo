//
//  DYNetworking+CourseCategoryHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/26.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"

@interface DYNetworking (CourseCategoryHttpRequest)

+ (void)getCourseCategoryData:(void (^) (NSArray *array))dataBlock
                         fail:(DYResponseFail)failBlock;

@end
