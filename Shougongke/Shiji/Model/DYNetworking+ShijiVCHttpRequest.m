//
//  DYNetworking+ShijiVCHttpRequest.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking+ShijiVCHttpRequest.h"
#import "ShijiVCModel.h"

@implementation DYNetworking (ShijiVCHttpRequest)

+ (void)getShijiViewControllerData:(NSString *)url
                             block:(void (^)(ShijiVCModel *))dataBlock
                              fail:(DYResponseFail)failBlock{
    [DYNetworking getWithUrl:url
                refreshCache:YES
                     success:^(id response) {
                         NSDictionary *resultDic = (NSDictionary *)response;
                         if ([resultDic[@"status"] integerValue] == 1) {
                             ShijiVCModel *shijimodel = [ShijiVCModel mj_objectWithKeyValues:resultDic[@"data"]];
                             dataBlock(shijimodel);
                         }
                     } fail:^(NSError *error) {
                         failBlock(error);
                     }];
    return;
}

@end
