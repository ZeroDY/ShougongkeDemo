//
//  DYNetworking+CourseDetailHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+CourseDetailHttpRequest.h"

@implementation DYNetworking (CourseDetailHttpRequest)

+ (void)getCourseDetailWithCourseId:(NSString *)cid
                              block:(void (^)(CourseDetail *))dataBlock
                               fail:(DYResponseFail)failBlock{
    NSString *url = [NSString stringWithFormat:@"index.php?c=Course&a=CourseDetial&id=%@&vid=16",cid];
    [DYNetworking getWithUrl:url
                refreshCache:YES
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             CourseDetail *model = [CourseDetail mj_objectWithKeyValues:resultDic[@"data"]];
                             dataBlock(model);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
    return;
}

@end
