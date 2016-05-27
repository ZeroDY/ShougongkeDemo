//
//  DYNetworking+CourseVideoListHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"

@interface DYNetworking (CourseVideoListHttpRequest)

+ (void)getCourseVideoListData:(void (^) (NSArray *array))dataBlock
                            fail:(DYResponseFail)failBlock;

@end
