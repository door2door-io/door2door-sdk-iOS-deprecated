//
//  Event.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 25/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


public enum Stage {
    
    case search
    case interest
    case book
    case begin
    case pay
    case end
    case cancel
    
    func stringRepresentation() -> String {
        
        switch self {
            case .search:
                return "search"
            case .interest:
                return "interest"
            case .book:
                return "book"
            case .begin:
                return "begin"
            case .pay:
                return "pay"
            case .end:
                return "end"
            case .cancel:
                return "cancel"
        }
    }
}

public enum EventType {
    
    case tripSearch
}


public class Event: NSObject {

    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public fileprivate(set) var stage: Stage
    public fileprivate(set) var timeStamp: String
    public fileprivate(set) var actor: Person
    public fileprivate(set) var eventType: EventType
 
    // ------------------------------------------------------------------------------------------
    // MARK: Initializer
    // ------------------------------------------------------------------------------------------
    public init(stage: Stage, actor: Person, eventType: EventType) {
    
        self.stage = stage
        self.actor = actor
        self.eventType = eventType
        
        self.timeStamp = Date.ISO8601TimeStampString()
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Object to JSON Dict Mapping
    // ------------------------------------------------------------------------------------------
    public func jsonRepresentation() -> Dictionary<String, Any> {
    
        fatalError("Subclass must Override.")
    }
}
