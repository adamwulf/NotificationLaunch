//
//  AppDelegate.m
//  NotificationLaunch
//
//  Created by Adam Wulf on 4/2/18.
//  Copyright © 2018 Milestone Made. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()<NSUserNotificationCenterDelegate>

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ApplicationDidFinishLaunching" object:nil userInfo:@{ @"notification" : aNotification }];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


#pragma mark - NSUserNotificationCenter Delegate

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification
{
    NSLog(@"Activated notification: %@", notification);
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification
{
    NSLog(@"Delivered notification: %@", notification);
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}

@end
