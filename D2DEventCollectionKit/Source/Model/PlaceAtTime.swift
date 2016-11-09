//
//  PlaceAtTime.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 09/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


public struct PlaceAtTime {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public fileprivate(set) var place: Place
    public fileprivate(set) var timestamp: String?
    
    // ------------------------------------------------------------------------------------------
    // MARK: JSON Representation
    // ------------------------------------------------------------------------------------------
    public func jsonRepresentation() -> Dictionary<String, Any>? {
        
        var jsonDictionary = [String: Any]()
        
        jsonDictionary["place"] = self.place.jsonRepresentation()
        jsonDictionary["timestamp"] = self.timestamp ?? NSNull()
        
        return jsonDictionary
    }
}
