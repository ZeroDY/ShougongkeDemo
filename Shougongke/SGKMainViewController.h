//
//  MainViewController.h
//  Shougongke
//
//  Created by 周德艺 on 16/5/18.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGKHomeViewController.h"
#import "SGKCourseViewController.h"
#import "SGKHandCircleViewController.h"
#import "SGKShijiViewController.h"
#import "SGKUserViewController.h"

@interface SGKMainViewController : UITabBarController

@property (nonatomic, strong) UINavigationController *homeNavigationController;
@property (nonatomic, strong) UINavigationController *courseNavigationController;
@property (nonatomic, strong) UINavigationController *handCircleNavigationController;
@property (nonatomic, strong) UINavigationController *shijiNavigationController;
@property (nonatomic, strong) UINavigationController *userNavigationController;

@end
