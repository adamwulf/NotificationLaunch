//
//  ViewController.m
//  NotificationLaunch
//
//  Created by Adam Wulf on 4/2/18.
//  Copyright © 2018 Milestone Made. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet NSTextView *textView;

@end

@implementation ViewController{
    NSNotification *_notification;
}

-(void) updateTextView{
    [_textView setString:[NSString stringWithFormat:@"notification user info: %@", [_notification userInfo]]];
}

-(void) viewDidLoad{
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(applicationDidFinishLaunching:) name:@"ApplicationDidFinishLaunching" object:nil];
}

-(void) applicationDidFinishLaunching:(NSNotification*)notification{
    _notification = [notification userInfo][@"notification"];
    [self updateTextView];
}

-(void) viewDidAppear{
    [super viewDidAppear];
    
    [self updateTextView];
}

-(IBAction)triggerNotificationWithOptions:(id)sender{
    NSUserNotification *userNotification = [[NSUserNotification alloc] init];
    NSString *title = @"Additional Options";
    NSString *informativeText = @"Missing user notification in launch notification";
    
    [userNotification setIdentifier:[[NSUUID UUID] UUIDString]];
    [userNotification setTitle:title];
    [userNotification setSubtitle:@"Subtitle"];
    [userNotification setInformativeText:informativeText];
    [userNotification setHasActionButton:YES];
    [userNotification setActionButtonTitle:NSLocalizedString(@"Accept", @"Accept (accept an invitation)")];

    NSArray *additionalActions = @[
                                   [NSUserNotificationAction actionWithIdentifier:@"decline" title:NSLocalizedString(@"Decline", @"Decline (decline an invitation)")],
                                   [NSUserNotificationAction actionWithIdentifier:@"maybe" title:NSLocalizedString(@"Maybe", @"Maybe (respond maybe to an invitation)")],
                                   ];
    
    [userNotification setAdditionalActions:additionalActions];

    [userNotification setOtherButtonTitle:NSLocalizedString(@"Close", @"Alarm notification")];

    [[NSApplication sharedApplication] hide:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:userNotification];
    });
}

-(IBAction)triggerNotificationWithoutOptions:(id)sender{
    NSUserNotification *userNotification = [[NSUserNotification alloc] init];
    NSString *title = @"No Additional Options";
    NSString *informativeText = @"Shows user notification in launch notification";
    
    [userNotification setIdentifier:[[NSUUID UUID] UUIDString]];
    [userNotification setTitle:title];
    [userNotification setSubtitle:@"Subtitle"];
    [userNotification setInformativeText:informativeText];
    [userNotification setHasActionButton:YES];
    [userNotification setActionButtonTitle:NSLocalizedString(@"Accept", @"Accept (accept an invitation)")];
    
    [userNotification setOtherButtonTitle:NSLocalizedString(@"Close", @"Alarm notification")];
    
    [[NSApplication sharedApplication] hide:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:userNotification];
    });
}

@end
