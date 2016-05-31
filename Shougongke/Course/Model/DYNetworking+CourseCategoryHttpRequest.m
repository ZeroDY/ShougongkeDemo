//
//  DYNetworking+CourseCategoryHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/26.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+CourseCategoryHttpRequest.h"
#import "CourseCategory.h"

@implementation DYNetworking (CourseCategoryHttpRequest)

+ (void)getCourseCategoryData:(void (^)(NSArray *))dataBlock
                         fail:(DYResponseFail)failBlock{
    [DYNetworking getWithUrl:SGKApiKeyCourseCategory
                refreshCache:YES
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             NSArray *array = [CourseCategory mj_objectArrayWithKeyValuesArray:resultDic[@"data"]];
                             dataBlock(array);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
    
}



@end
