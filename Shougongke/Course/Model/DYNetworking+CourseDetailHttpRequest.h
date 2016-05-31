//
//  DYNetworking+CourseDetailHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"
#import "CourseDetail.h"

@interface DYNetworking (CourseDetailHttpRequest)

+ (void)getCourseDetailWithCourseId:(NSString *)cid
                              block:(void (^) (CourseDetail *model))dataBlock
                               fail:(DYResponseFail)failBlock;

@end
