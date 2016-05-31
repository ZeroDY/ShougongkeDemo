//
//  UIViewController+SGKViewControllerCategory.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/31.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "UIViewController+SGKViewControllerCategory.h"

@implementation UIViewController (SGKViewControllerCategory)


- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

@end
