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
    public private(set) var jsonDict: Dictionary<String, String>? = nil
    
    // ------------------------------------------------------------------------------------------
    // MARK: Initializer
    // ------------------------------------------------------------------------------------------
    public init() {
        
        guard let configuration =  EventCollectionKit.sharedInstance.configuration else {
            
            return
        }
    
        // Default Setup
        self.jsonDict = ["timeStamp" : "",
                         "application" : configuration.applicationName,
                         "version" : configuration.applicationVersion]
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: JSON Representation
    // ------------------------------------------------------------------------------------------
    public func jsonData() -> Data? {
    
        if let dict = self.jsonDict {
        
            do {
                let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
                return data
            }
            catch let error as Error {
                
                return nil
            }
        }
        
        return nil
    }
}
