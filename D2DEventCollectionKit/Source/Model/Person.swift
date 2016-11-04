//
//  Person.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 26/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

public struct Person {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public fileprivate(set) var client: Client
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: JSON Representation
    // ------------------------------------------------------------------------------------------
    public func jsonRepresentation() -> Dictionary<String, Any>? {
     
        var jsonDictionary = [String: Any]()
        
        jsonDictionary["client"] = self.client.jsonRepresentation()
        
        return jsonDictionary
    }
}
