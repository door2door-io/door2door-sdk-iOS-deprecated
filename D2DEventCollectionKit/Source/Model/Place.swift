//
//  Place.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 26/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

public struct Place {

    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public fileprivate(set) var latitude: Double
    public fileprivate(set) var longitude: Double
    public fileprivate(set) var name: String?
    public fileprivate(set) var street: String?
    public fileprivate(set) var city: String?
    public fileprivate(set) var postalCode: String?
    public fileprivate(set) var country: String?
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: JSON Representation
    // ------------------------------------------------------------------------------------------
    public func jsonRepresentation() -> Dictionary<String, Any>? {
        
        var jsonDictionary = [String: Any]()
        
        jsonDictionary["latitude"] = NSNumber(value: self.latitude)
        jsonDictionary["longitude"] = NSNumber(value: self.longitude)
        jsonDictionary["name"] = self.name ?? NSNull()
        jsonDictionary["street"] = self.street ?? NSNull()
        jsonDictionary["city"] = self.city ?? NSNull()
        jsonDictionary["postal_code"] = self.postalCode ?? NSNull()
        jsonDictionary["country"] = self.country ?? NSNull()
    
        return jsonDictionary
    }
}
