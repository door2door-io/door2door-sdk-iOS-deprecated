//
//  Trip.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 26/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

public enum ModeOfTransportations {
    
    case train
    case walk
    case publicTransport
    case carSharing
    case bikeSharing
    case taxi
    case privateBike
    case rideSharing
    case other

    func stringRepresentation() -> String {
        
        switch self {
            
        case .train:
            return "train"
        case .walk:
                return "walk"
        case .publicTransport:
            return "public_transport"
        case .carSharing:
            return "car_sharing"
        case .bikeSharing:
            return "bike_sharing"
        case .taxi:
            return "taxi"
        case .privateBike:
            return "private_bike"
        case .rideSharing:
            return "ride_sharing"
        case .other:
            return "other"
        }
    }
}


public struct Trip {

    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public fileprivate(set) var departure: PlaceAtTime
    public fileprivate(set) var arrival: PlaceAtTime
    public fileprivate(set) var modeOfTransportations: [ModeOfTransportations]
    
    // ------------------------------------------------------------------------------------------
    // MARK: JSON Representation
    // ------------------------------------------------------------------------------------------
    public func jsonRepresentation() -> Dictionary<String, Any>? {
        
        var jsonDictionary = [String: Any]()
        
        jsonDictionary["modeOfTransportations"] = self.modeOfTransportations.map {$0.stringRepresentation()}
        
        jsonDictionary["departure"] = self.departure.jsonRepresentation()
        jsonDictionary["arrival"] = self.arrival.jsonRepresentation()
        
        return jsonDictionary
    }
}
