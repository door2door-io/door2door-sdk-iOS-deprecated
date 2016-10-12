//
//  EventCollectionKit.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 11/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

/// D2DEventCollectionKit. This class is your entry point of using the EventCollectionKit functionality.

@objc (D2DEventCollectionKit) public class EventCollectionKit: NSObject, EventCollectionKitProtocol {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Private Properties
    // ------------------------------------------------------------------------------------------

    public private(set) var configuration: EventCollectionKitConfiguration?
    
    private let networkManager = NetworkManager()
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Initialization
    // ------------------------------------------------------------------------------------------
    public static let sharedInstance: EventCollectionKit = {
        
        let sharedInstance = EventCollectionKit()
        
        return sharedInstance
    }()
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Registration
    // ------------------------------------------------------------------------------------------
    public class func register(applicationToken: String, applicationName: String, applicationVersion: String) {
        
        EventCollectionKit.sharedInstance.configuration =
            EventCollectionKitConfiguration(applicationToken: applicationToken,
                                            applicationName: applicationName,
                                            applicationVersion: applicationVersion)
        
        let a = Event.routeEvent()
        
        print(a)
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Logging
    // ------------------------------------------------------------------------------------------
    public class func enableLogging(logginEnabled: Bool) {
    
        if let configuration = EventCollectionKit.sharedInstance.configuration {
           
            configuration.loggingEnabled = logginEnabled
        }
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Event Sending
    // ------------------------------------------------------------------------------------------
    public class func send(event: Event) {
    
        EventCollectionKit.sharedInstance.networkManager.send(event: event)
    }
}
