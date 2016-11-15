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

    internal private(set) var configuration: EventCollectionKitConfiguration?
    
    private let networkManager = NetworkManager()
    
    // ------------------------------------------------------------------------------------------
    // MARK: Singleton
    // ------------------------------------------------------------------------------------------
    internal static let sharedInstance = EventCollectionKit()
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Registration
    // ------------------------------------------------------------------------------------------
    public class func register(applicationToken: String, applicationName: String, applicationVersion: String?) {
        
        EventCollectionKit.sharedInstance.configuration =
            EventCollectionKitConfiguration(applicationToken: applicationToken,
                                            applicationName: applicationName,
                                            applicationVersion: applicationVersion)
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Logging
    // ------------------------------------------------------------------------------------------
    public class func enable(logging: Bool) {
    
        if let configuration = EventCollectionKit.sharedInstance.configuration {
           
            configuration.loggingEnabled = logging
        }
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Event Sending
    // ------------------------------------------------------------------------------------------
    public class func send(event: Event) {
        
        if EventCollectionKit.isRegistered() {
        
            EventCollectionKit.sharedInstance.networkManager.send(event: event)
        }
        else {

            assertionFailure(ErrorMessages.registrationErrorDescription())
        }
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Helper
    // ------------------------------------------------------------------------------------------
    private class func isRegistered () -> Bool {
    
        if let _ = EventCollectionKit.sharedInstance.configuration {
        
            return true
        }
        
        return false
    }
}
