//
//  DYNetworking+ActivityOpusHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/30.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+ActivityOpusHttpRequest.h"
#import "ActivityOpus.h"

@implementation DYNetworking (ActivityOpusHttpRequest)

+ (void)getActivityOpusDataWithParam:(NSDictionary *)param
                             success:(void (^) (NSArray *array))successBlock
                                fail:(DYResponseFail)failBlock{
    [DYNetworking getWithUrl:@"/index.php?c=Competition&a=getOpus&vid=16"
                refreshCache:YES
                      params:param
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             NSArray *dataArr = [ActivityOpus mj_objectArrayWithKeyValuesArray:resultDic[@"data"]];
                             successBlock(dataArr);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
    return;
    
}

@end
