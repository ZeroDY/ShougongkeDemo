//
//  DYNetworking+ActivityOpusHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/30.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"

@interface DYNetworking (ActivityOpusHttpRequest)

+ (void)getActivityOpusDataWithParam:(NSDictionary *)param
                             success:(void (^) (NSArray *array))successBlock
                                fail:(DYResponseFail)failBlock;

@end
