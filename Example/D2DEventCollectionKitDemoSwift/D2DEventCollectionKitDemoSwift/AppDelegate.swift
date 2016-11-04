//
//  AppDelegate.swift
//  D2DEventCollectionKitDemoSwift
//
//  Created by Elmar Tampe on 11/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import UIKit
import D2DEventCollectionKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        
        
        // Add D2DEventCollectionKit integration
        self.setupTrackingIntegration()
        
        // Create one test event for a trip search
        self.testSearchEvent()
        
        return true
    }
    
    // ------------------------------------------------------------------------------------------
    // MARK: D2DEventCollectionKit Functions
    // ------------------------------------------------------------------------------------------
    public func setupTrackingIntegration() {
    
        EventCollectionKit.register(applicationToken: "YOUR_APP_TOKEN_GOES_HERE",
                                    applicationName: "Ally App",
                                    applicationVersion: "1.0.0")
        
        EventCollectionKit.enableLogging(loggingEnabled: true)
    }
    
    
    fileprivate func testSearchEvent() {
    
        let tripSearchEvent  = TripEvent.tripSearchEvent(originLatitude: 52.5230554,
                                                         originLongitude: 13.4122575,
                                                         originName: "Alexanderplatz",
                                                         originStreet: "Alexanderplatz",
                                                         originCity: "Berlin",
                                                         originPostalCode: "10119",
                                                         originCountry: "Germany",
                                                         destinationLatitude: 52.5300641,
                                                         destinationLongitude: 13.4008385,
                                                         destinationName: "Door2Door HQ",
                                                         destinationStreet: "Torstrasse 109",
                                                         destinationCity: "Berlin",
                                                         destinationPostalCode: "10178",
                                                         destinationCountry: "Germany")
        
        EventCollectionKit.send(event: tripSearchEvent)
    }
    

    // MARK: - Split view
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

