//
//  DYNetworking+SGKTalentListHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+TalentListHttpRequest.h"
#import "TalentListModel.h"

@implementation DYNetworking (TalentListHttpRequest)

+ (void)getTalentListControllerData:(void (^)(NSArray *))dataBlock
                               fail:(DYResponseFail)failBlock{
    [DYNetworking getWithUrl:@"index.php?c=Index&a=daren"
                refreshCache:YES
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             NSArray *array = [TalentListModel mj_objectArrayWithKeyValuesArray:resultDic[@"data"]];
                             dataBlock(array);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
    return;
}

@end
