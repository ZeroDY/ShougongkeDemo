//
//  SystemsDetection.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/18.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sys/utsname.h"

@interface SystemsDetection : NSObject

+ (NSString *)getDeviceVersionInfo;
+ (NSString *)getDeviceVersCoding;

@end
