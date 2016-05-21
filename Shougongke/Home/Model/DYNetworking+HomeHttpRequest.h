//
//  DYNetworking+HomeHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"
#import "TalentObject.h"

@interface DYNetworking (HomeHttpRequest)

+ (void)getHomeVCData:(void (^) (NSArray *slideArr))slideArrBlock
               talent:(void (^) (TalentObject *talent))talentBlock
             topicArr:(void (^) (NSArray *topicArr))topicArrBlock;

@end
