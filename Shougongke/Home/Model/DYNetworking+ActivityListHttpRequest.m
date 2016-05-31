//
//  DYNetworking+ActivityHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+ActivityListHttpRequest.h"
#import "Activity.h"

@implementation DYNetworking (ActivityListHttpRequest)

+ (void)getActivityControllerData:(void (^)(NSArray *))activityArrBlock
                             fail:(DYResponseFail)failBlock{
    [DYNetworking getWithUrl:SGKApiKeyActivityList
                refreshCache:YES
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             NSArray *activityArr = [Activity mj_objectArrayWithKeyValuesArray:resultDic[@"data"]];
                             activityArrBlock(activityArr);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
    return;
}


@end
