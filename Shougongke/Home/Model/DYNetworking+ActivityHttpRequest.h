//
//  DYNetworking+ActivityHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"

@interface DYNetworking (ActivityHttpRequest)

+ (void)getActivityControllerData:(void (^) (NSArray *activityArr))activityArrBlock
                             fail:(DYResponseFail)failBlock;

@end
