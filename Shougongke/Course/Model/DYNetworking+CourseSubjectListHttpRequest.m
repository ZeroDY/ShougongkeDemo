//
//  DYNetworking+CoursePicListHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+CourseSubjectListHttpRequest.h"
#import "TopicObject.h"

@implementation DYNetworking (CourseSubjectListHttpRequest)

+ (void)getCourseSubjectListData:(void (^)(NSArray *))dataBlock
                        fail:(DYResponseFail)failBlock{
    [DYNetworking getWithUrl:@"/index.php?c=Course&a=topicList&tag_id=53&vid=16"
                refreshCache:YES
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             NSArray *array = [TopicObject mj_objectArrayWithKeyValuesArray:resultDic[@"data"]];
                             dataBlock(array);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
    
}

@end