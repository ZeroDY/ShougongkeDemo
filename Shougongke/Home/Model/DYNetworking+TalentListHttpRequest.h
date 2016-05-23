//
//  DYNetworking+SGKTalentListHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/23.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"

@interface DYNetworking (TalentListHttpRequest)

+ (void)getTalentListControllerData:(void (^) (NSArray *array))dataBlock
                             fail:(DYResponseFail)failBlock;

@end
