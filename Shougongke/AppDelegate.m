//
//  AppDelegate.m
//  Shougongke
//
//  Created by 周德艺 on 16/5/16.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    [DYNetworking updateBaseUrl:@"http://m.shougongke.com"];
    [DYNetworking enableInterfaceDebug:NO];
    [DYNetworking cacheGetRequest:YES shoulCachePost:YES];
    /**
     *  设置全局属性
     *  UINavigationBar
     */
    NSDictionary *navigationBarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:navigationBarTitleTextAttributes];
    [[UINavigationBar appearance] setBarTintColor:mainColor];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    //设置状态栏的字体颜色模式
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    /**
     *	UITabBarItem
     */
    NSDictionary *normalBarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor],NSForegroundColorAttributeName, nil];
    NSDictionary *selectedBarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:mainColor,NSForegroundColorAttributeName, nil];
    [[UITabBarItem appearance]setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    [[UITabBarItem appearance]setTitleTextAttributes:normalBarTitleTextAttributes forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:selectedBarTitleTextAttributes forState:UIControlStateSelected];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
