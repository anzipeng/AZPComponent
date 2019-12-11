//
//  AppDelegate.m
//  AZPComponent
//
//  Created by zipeng an  on 2019/12/11.
//  Copyright © 2019 zipeng an . All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
 
    ViewController * vc= [[ViewController alloc]init];
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = navi;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}




@end
