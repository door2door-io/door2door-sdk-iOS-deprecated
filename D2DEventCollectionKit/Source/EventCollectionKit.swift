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
    private var loggingEnabled: Bool = false
    
    // ------------------------------------------------------------------------------------------
    // MARK: Initialization
    // ------------------------------------------------------------------------------------------
    static let sharedInstance: EventCollectionKit = {
        
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
}
