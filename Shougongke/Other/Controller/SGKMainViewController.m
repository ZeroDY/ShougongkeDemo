//
//  MainViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/18.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKMainViewController.h"
#import "SGKLoginViewController.h"

@interface SGKMainViewController ()<UITabBarControllerDelegate>

@end

@implementation SGKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewControllers:@[
                               self.homeNavigationController,
                               self.courseNavigationController,
                               self.handCircleNavigationController,
                               self.shijiNavigationController,
                               self.userNavigationController
                               ] animated:YES];
        
    /**
     *	UITabBarItem
     */
    UITabBar *tabBar = self.tabBar;
    for (UITabBarItem *item in self.tabBar.items) {
        item.imageInsets = UIEdgeInsetsMake(-4, 0, 4, 0);
    }
    tabBar.tintColor = mainColor;
    self.delegate = self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if (viewController == tabBarController.viewControllers[2]) {
        
        SGKLoginViewController *loginViewController = [SGKLoginViewController new];
        loginViewController.hidesBottomBarWhenPushed = YES;
        [(UINavigationController *)tabBarController.selectedViewController pushViewController:loginViewController animated:YES];
        return NO;
    } else {
        return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - getter and setter
- (UINavigationController *)homeNavigationController{
    if (!_homeNavigationController) {
        SGKHomeViewController *homeViewController = [[SGKHomeViewController alloc]init];
        _homeNavigationController = [[UINavigationController alloc]initWithRootViewController:homeViewController];
        _homeNavigationController.tabBarItem.tag = 0;
        _homeNavigationController.tabBarItem.title = @"首页";
        _homeNavigationController.tabBarItem.image = [[UIImage imageNamed:@"sgk_tab_home_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _homeNavigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"sgk_tab_home_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationController.navigationBar.translucent = NO;
    }
    return _homeNavigationController;
}

- (UINavigationController *)courseNavigationController{
    if (!_courseNavigationController) {
        SGKCourseViewController *courseViewController = [[SGKCourseViewController alloc]init];
        _courseNavigationController = [[UINavigationController alloc]initWithRootViewController:courseViewController];
        _courseNavigationController.tabBarItem.tag = 1;
        _courseNavigationController.tabBarItem.title = @"教程";
        _courseNavigationController.tabBarItem.image = [[UIImage imageNamed:@"sgk_tab_course_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _courseNavigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"sgk_tab_course_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _courseNavigationController;
}

- (UINavigationController *)handCircleNavigationController{
    if (!_handCircleNavigationController) {
        SGKHandCircleViewController *handCircleViewController = [[SGKHandCircleViewController alloc]init];
        _handCircleNavigationController = [[UINavigationController alloc]initWithRootViewController:handCircleViewController];
        _handCircleNavigationController.tabBarItem.tag = 2;
        _handCircleNavigationController.tabBarItem.title = @"手工圈";
        _handCircleNavigationController.tabBarItem.image = [[UIImage imageNamed:@"sgk_tab_zone_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _handCircleNavigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"sgk_tab_zone_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _handCircleNavigationController;
}

- (UINavigationController *)shijiNavigationController{
    if (!_shijiNavigationController) {
        SGKShijiViewController *shijiViewController = [[SGKShijiViewController alloc]init];
        _shijiNavigationController  = [[UINavigationController alloc]initWithRootViewController:shijiViewController];
        _shijiNavigationController.tabBarItem.title = @"市集";
        _shijiNavigationController.tabBarItem.image = [[UIImage imageNamed:@"sgk_tab_sales_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _shijiNavigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"sgk_tab_sales_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _shijiNavigationController;
}

- (UINavigationController *)userNavigationController{
    if (!_userNavigationController) {
        SGKUserViewController *userViewController = [[SGKUserViewController alloc]init];
        _userNavigationController = [[UINavigationController alloc]initWithRootViewController:userViewController];
        _userNavigationController.tabBarItem.title = @"我的";
        _userNavigationController.tabBarItem.image = [[UIImage imageNamed:@"sgk_tab_personal_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _userNavigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"sgk_tab_personal_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _userNavigationController;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
