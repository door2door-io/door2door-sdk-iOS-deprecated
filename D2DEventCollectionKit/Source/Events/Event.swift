//
//  Event.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 25/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


public class Event: NSObject {

    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public fileprivate(set) var timeStamp: String
    public fileprivate(set) var actor: Person
 
    // ------------------------------------------------------------------------------------------
    // MARK: Initializer
    // ------------------------------------------------------------------------------------------
    public init(actor: Person) {
    
        self.actor = actor
        
        self.timeStamp = Date.ISO8601TimeStampString()
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Object to JSON Dict Mapping
    // ------------------------------------------------------------------------------------------
    public func jsonRepresentation() -> Dictionary<String, Any> {
    
        fatalError("Subclass must Override.")
    }
}
