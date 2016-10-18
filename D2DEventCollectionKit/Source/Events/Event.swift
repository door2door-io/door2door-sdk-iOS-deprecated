//
//  Event.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 11/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

public class Event {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public private(set) var jsonPayload: Dictionary<String, String>? = nil
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Initializer
    // ------------------------------------------------------------------------------------------
    public init() {
        
        self.setupCommonJSONFields()
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Setup
    // ------------------------------------------------------------------------------------------
    private func setupCommonJSONFields() {
    
        guard let configuration =  EventCollectionKit.sharedInstance.configuration else {
            
            // TODO: Error handling.
            return
        }
        
        let timeStamp = Date.ISO8601TimeStampString()
        let applicationName = configuration.applicationName
        let applicationVersion = configuration.applicationVersion
        
        // TODO: This needs to be tracked as well
        // - device language
        // - device
        // - os version
        // - country
        
        var deviceID = ""
        
        if let identifier = UIDevice.current.identifierForVendor {
            
            deviceID = identifier.uuidString
        }
        
        let uuid = UUID().uuidString
        
        self.jsonPayload = ["timeStamp" : timeStamp,
                            "application" : applicationName,
                            "version" : applicationVersion,
                            "uuid" : uuid,
                            "device_id" : deviceID]
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: JSON Representation
    // ------------------------------------------------------------------------------------------
    public func jsonData() -> Data? {
    
        if let payload = self.jsonPayload {
        
            do {
                let data = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
                return data
            }
            catch let error as Error {
                
                return nil
            }
        }
        
        return nil
    }
}
