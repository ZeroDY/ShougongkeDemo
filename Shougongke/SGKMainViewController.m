//
//  MainViewController.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/18.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "SGKMainViewController.h"
#import "InfoViewController.h"

@interface SGKMainViewController ()

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
        _homeNavigationController.tabBarItem.title = @"首页";
        _homeNavigationController.tabBarItem.image = [[UIImage imageNamed:@"sgk_tab_home_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _homeNavigationController.tabBarItem.selectedImage = [[UIImage imageNamed:@"sgk_tab_home_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return _homeNavigationController;
}

- (UINavigationController *)courseNavigationController{
    if (!_courseNavigationController) {
        SGKCourseViewController *courseViewController = [[SGKCourseViewController alloc]init];
        _courseNavigationController = [[UINavigationController alloc]initWithRootViewController:courseViewController];
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
