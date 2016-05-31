//
//  DYNetworking+CourseVideoListHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+CourseVideoListHttpRequest.h"
#import "CourseVideo.h"

@implementation DYNetworking (CourseVideoListHttpRequest)

+ (void)getCourseVideoListDataWithParam:(NSDictionary *)param
                                  block:(void (^)(NSArray *))dataBlock
                                   fail:(DYResponseFail)failBlock{
    [DYNetworking getWithUrl:SGKApiKeyCourseVideoList
                refreshCache:YES
                      params:param
                     success:^(id response)  {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             NSArray *array = [CourseVideo mj_objectArrayWithKeyValuesArray:resultDic[@"data"]];
                             dataBlock(array);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
}

@end
