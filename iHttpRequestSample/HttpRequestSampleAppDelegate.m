//
//  HttpRequestSampleAppDelegate.m
//  iHttpRequestSample
//
//  Created by otiai10 on 2014/08/10.
//  Copyright (c) 2014年 otiai10. All rights reserved.
//

#import "HttpRequestSampleAppDelegate.h"

@implementation HttpRequestSampleAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // (1) URLをつくる（localhostだとダメっぽかったので、適当につくったHTTPサーバ）
    NSURL *url = [NSURL URLWithString:@"http://otiai10.com:8080"];
    // (2) Requestをつくる
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // (3) メソッドを指定
    [request setHTTPMethod:@"POST"];
    // (4) リクエストボディを指定
    [request setHTTPBody:[@"message=てすてすこちらiOSクライアント" dataUsingEncoding:NSUTF8StringEncoding]];
    // (5) Connectionをつくる
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError != nil) {
            NSLog(@"%@", connectionError);
            return;
        }
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
