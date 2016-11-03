//
//  Client.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 26/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

public struct Client {

    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public fileprivate(set) var deviceID: String?
    public fileprivate(set) var plattform: String?
    public fileprivate(set) var application: String!
    public fileprivate(set) var version: String?
        
    
    // ------------------------------------------------------------------------------------------
    // MARK: JSON Representation
    // ------------------------------------------------------------------------------------------
    public func jsonRepresentation() -> Dictionary<String, Any>? {
        
        var jsonDictionary = [String: Any]()
        
        jsonDictionary["device_id"] = self.deviceID ?? NSNull()
        jsonDictionary["platform"] = self.plattform ?? NSNull()
        jsonDictionary["application"] = self.application
        jsonDictionary["version"] = self.version ?? NSNull()
        
        return jsonDictionary
    }
}
