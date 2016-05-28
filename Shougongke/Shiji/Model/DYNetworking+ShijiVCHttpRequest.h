//
//  DYNetworking+ShijiVCHttpRequest.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/28.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "DYNetworking.h"
#import "ShijiVCModel.h"

@interface DYNetworking (ShijiVCHttpRequest)

+ (void)getShijiViewControllerData:(NSString *)url
                             block:(void (^) (ShijiVCModel *model))dataBlock
                              fail:(DYResponseFail)failBlock;


@end
