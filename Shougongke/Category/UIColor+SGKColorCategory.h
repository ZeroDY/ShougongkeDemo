//
//  UIColor+SGKColorCategory.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/27.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SGKColorCategory)

/**
 *	十六进制转 uicolor
 */
+ (UIColor *)colorWithHexString: (NSString *)hexString;

@end
