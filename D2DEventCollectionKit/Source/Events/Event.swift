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
        
        guard let configuration =  EventCollectionKit.sharedInstance.configuration else {
            
            return
        }
        
        let timeStamp = Date.ISO8601TimeStampString()
        let applicationName = configuration.applicationName
        let applicationVersion = configuration.applicationVersion
        
        self.jsonPayload = ["timeStamp" : timeStamp,
                            "application" : applicationName,
                            "version" : applicationVersion]
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
