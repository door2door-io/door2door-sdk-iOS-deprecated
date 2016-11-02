//
//  AppDelegate.m
//  D2DEventCollectionKitDemoObjc
//
//  Created by Elmar Tampe on 11/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"

@import D2DEventCollectionKit;

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    splitViewController.delegate = self;
    
    // Add D2DEventCollectionKit integration
    [self setupTrackingIntegration];
    
    // Create one test event for a trip search
    [self testSearchEvent];
    
    return YES;
}


// ------------------------------------------------------------------------------------------
// MARK: D2DEventCollectionKit Functions
// ------------------------------------------------------------------------------------------
- (void)setupTrackingIntegration {
    
    [D2DEventCollectionKit registerWithApplicationToken:@"YOUR_APP_TOKEN_GOES_HERE"
                                        applicationName:@"Ally App"
                                     applicationVersion:@"1.0.0"];
    
    [D2DEventCollectionKit enableLoggingWithLogginEnabled:YES];
}


- (void)testSearchEvent {
    
   D2DTripEvent *tripEvent = [D2DTripEvent tripSearchEventWithOriginLatitude:52.5230554
                                                             originLongitude:13.4122575
                                                                  originName:@"Alexanderplatz"
                                                                originStreet:@"Alexanderplatz"
                                                                  originCity:@"Berlin"
                                                            originPostalCode:@"10178"
                                                               originCountry:@"Germany"
                                                         destinationLatitude:52.5300641
                                                        destinationLongitude:13.4008385
                                                             destinationName:@"Door2Door HQ"
                                                           destinationStreet:@"Torstrasse 109"
                                                             destinationCity:@"Berlin"
                                                       destinationPostalCode:@"10119"
                                                          destinationCountry:@"Germany"];
    
    [D2DEventCollectionKit sendWithEvent:tripEvent];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Split view

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
        return YES;
    } else {
        return NO;
    }
}

@end
