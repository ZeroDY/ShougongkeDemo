//
//  DYNetworking+CoursePicListHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"

@interface DYNetworking (CourseSubjectListHttpRequest)

+ (void)getCourseSubjectListDataTageid:(NSString *)tagid
                                 block:(void (^) (NSArray *array))dataBlock
                                  fail:(DYResponseFail)failBlock;

@end
