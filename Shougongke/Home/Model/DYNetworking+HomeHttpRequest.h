//
//  DYNetworking+HomeHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/22.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"
#import "Talent.h"
#import "HomeViewModel.h"

@interface DYNetworking (HomeHttpRequest)

+ (void)getHomeViewControllerData:(void (^) (HomeViewModel *homeViewModel))homeViewModelBlock
                             fail:(DYResponseFail)failBlock;


@end
