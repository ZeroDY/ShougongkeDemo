//
//  DYNetworking+CoursePicListHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+CourseSubjectListHttpRequest.h"
#import "HomeTopic.h"

@implementation DYNetworking (CourseSubjectListHttpRequest)


+(void)getCourseSubjectListDataTageid:(NSString *)tagid
                                block:(void (^)(NSArray *))dataBlock
                                 fail:(DYResponseFail)failBlock{
    NSString *url = [NSString stringWithFormat:@"/index.php?c=Course&a=topicList&tag_id=%@&vid=16",tagid];
    [DYNetworking getWithUrl:url
                refreshCache:YES
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             NSArray *array = [HomeTopic mj_objectArrayWithKeyValuesArray:resultDic[@"data"]];
                             dataBlock(array);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
    
}

@end
