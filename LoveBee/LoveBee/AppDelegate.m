//
//  AppDelegate.m
//  LoveBee
//
//  Created by vane on 16/9/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "LBTabBarController.h"
#import "LBGuideCollectionViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [NSThread sleepForTimeInterval:1.0];
    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];

    
    _window = [[UIWindow alloc]initWithFrame:kScreenBounds];
    _window.backgroundColor = [UIColor whiteColor];
    //    _window.rootViewController = [LBTabBarController new];
    // 设置跟控制器
    self.window.rootViewController = [self pickViewController];
    
    [_window makeKeyAndVisible];
    
    // 把当前的版本号保存到沙盒中
    [self saveAppVersion];
    
//    self.tabBarController.tabBarItem.badgeValue = @"2";
    
    
    return YES;
}
// 选择应该显示的控制器
- (UIViewController*)pickViewController
{
    // 判断 沙盒和当前的版本号是否一致
    if ([[self loadSavedAppVersion] isEqualToString:[self loadAppVersion]]) {
        // 一致,应该显示tabbar
        // 创建tabbarController
        LBTabBarController* tab = [[LBTabBarController alloc] init];
        return tab;
    }
    else {
//         不一致,显示新特性页面(引导页)
        LBGuideCollectionViewController* guide = [[LBGuideCollectionViewController alloc] init];
        return guide;
    }
}

// 获取沙盒中保存的版本号
- (NSString*)loadSavedAppVersion
{
    // 获取ud对象
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    return [ud objectForKey:@"appVersion"];
}

// 把当前的版本号保存到沙盒当中
- (void)saveAppVersion
{
    // 获取info.plist
    NSDictionary* dict = [NSBundle mainBundle].infoDictionary;
    // 获取ud对象
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:dict[@"CFBundleShortVersionString"] forKey:@"appVersion"];
}

// 获取"当前"的版本号
- (NSString*)loadAppVersion
{
    // 获取info.plist
    NSDictionary* dict = [NSBundle mainBundle].infoDictionary;
    NSLog(@"%@", dict[@"CFBundleShortVersionString"]);
    return dict[@"CFBundleShortVersionString"];
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
