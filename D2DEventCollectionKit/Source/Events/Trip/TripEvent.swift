//
//  TripEvent.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 25/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


@objc (D2DTripEvent) public class TripEvent: Event {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public fileprivate(set) var trip: Trip
    
    // ------------------------------------------------------------------------------------------
    // MARK: Initializer
    // ------------------------------------------------------------------------------------------
    public init(stage: Stage, trip: Trip, eventType: EventType) {
        
        self.trip = trip
    
        let configuration = EventCollectionKit.sharedInstance.configuration
        
        let client = Client(deviceID: Session.deviceID(),
                            plattform: Session.plattform(),
                            application:(configuration?.applicationName)!,
                            version: configuration?.applicationVersion)
        
        let actor = Person(client: client)
        
        super.init(stage: stage, actor: actor, eventType: eventType)
    }
    
    // ------------------------------------------------------------------------------------------
    // MARK: Object to JSON Dict Mapping
    // ------------------------------------------------------------------------------------------
    public override func jsonRepresentation() -> Dictionary<String, Any> {
        
        var jsonDictionary = [String: Any]()
        
        jsonDictionary["stage"] = self.stage.stringRepresentation()
        jsonDictionary["timestamp"] = self.timeStamp
        jsonDictionary["actor"] = self.actor.jsonRepresentation()
        jsonDictionary["trip"] = self.trip.jsonRepresentation()

        return jsonDictionary
    }
    
 }
