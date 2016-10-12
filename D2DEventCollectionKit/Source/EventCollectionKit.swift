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
    private var appToken: String? = nil
    public private(set) var loggingEnabled: Bool = false
    
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
    public class func register(withAppToken: String) {
        
        EventCollectionKit.sharedInstance.appToken = withAppToken
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Logging
    // ------------------------------------------------------------------------------------------
    public class func enableLogging(logginEnabled: Bool) {
    
        EventCollectionKit.sharedInstance.loggingEnabled = logginEnabled
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Event Sending
    // ------------------------------------------------------------------------------------------
    public class func send(event: Event) {
    
        EventCollectionKit.sharedInstance.networkManager.send(event: event)
    }
}
