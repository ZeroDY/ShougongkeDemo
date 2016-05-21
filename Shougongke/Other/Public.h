//
//  Public.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/19.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#ifndef Public_h
#define Public_h

//设备的宽高
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
//获取颜色
#define RGBA(r, g, b, a)          [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)               RGBA(r, g, b, 1.0f)
#define mainColor                  RGB(235, 87, 84)
#define fontColor                  RGB(64, 64, 64)
//#define IMAGENAME(name)           [UIImage imageNamed:@"name"]

////字体
//#define kFONT16                  [UIFont systemFontOfSize:16.0f]
//#define kFONT15                  [UIFont systemFontOfSize:15.0f]
//#define kFONT12                  [UIFont systemFontOfSize:12.0f]
//#define kFONT10                  [UIFont systemFontOfSize:10.0f]

//系统版本
#define IOS_VERSION_8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0

#import "Masonry.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "DYNetworking.h"

#endif /* Public_h */
