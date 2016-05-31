//
//  DYNetworking+CoursePicListHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+CoursePicListHttpRequest.h"
#import "CoursePicListObject.h"

@implementation DYNetworking (CoursePicListHttpRequest)

+ (void)getCoursePicListDataWithParam:(NSDictionary *)param
                                block:(void (^)(NSArray *))dataBlock
                                 fail:(DYResponseFail)failBlock{
    [DYNetworking getWithUrl:SGKApiKeyCoursePictureList
                refreshCache:YES
                      params:param
                     success:^(id response)  {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             NSArray *array = [CoursePicListObject mj_objectArrayWithKeyValuesArray:resultDic[@"data"]];
                             dataBlock(array);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
}

@end
