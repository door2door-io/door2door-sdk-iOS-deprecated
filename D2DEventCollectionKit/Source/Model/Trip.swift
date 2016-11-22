//
//  Trip.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 26/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

@objc public enum ModesOfTransportation: Int {
    
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
    public fileprivate(set) var modesOfTransportation: [ModesOfTransportation]
    
    // ------------------------------------------------------------------------------------------
    // MARK: JSON Representation
    // ------------------------------------------------------------------------------------------
    public func jsonRepresentation() -> Dictionary<String, Any>? {
        
        var jsonDictionary = [String: Any]()
        
        jsonDictionary["modes_of_transportation"] = self.modesOfTransportation.map {$0.stringRepresentation()}
        jsonDictionary["departure"] = self.departure.jsonRepresentation()
        jsonDictionary["arrival"] = self.arrival.jsonRepresentation()
        
        return jsonDictionary
    }
    
    // ------------------------------------------------------------------------------------------
    // MARK: Trip Creation
    // ------------------------------------------------------------------------------------------
    public static func trip(modesOfTransportation: [ModesOfTransportation],
                            departureTime: Date?,
                            originLatitude: Double,
                            originLongitude: Double,
                            originName: String?,
                            originStreet: String?,
                            originCity: String?,
                            originPostalCode: String?,
                            originCountry: String?,
                            arrivalTime:Date?,
                            destinationLatitude: Double,
                            destinationLongitude: Double,
                            destinationName: String?,
                            destinationStreet: String?,
                            destinationCity: String?,
                            destinationPostalCode: String?,
                            destinationCountry: String?) -> Trip {
        
        let origin = Place(latitude: originLatitude,
                           longitude: originLongitude,
                           name: originName,
                           street: originStreet,
                           city: originCity,
                           postalCode: originPostalCode,
                           country: originCountry)
        
        let departure = PlaceAtTime(place: origin, timestamp: departureTime?.ISO8601TimeString())
        
        let destination = Place(latitude: destinationLatitude,
                                longitude: destinationLongitude,
                                name: destinationName,
                                street: destinationStreet,
                                city: destinationCity,
                                postalCode: destinationPostalCode,
                                country: destinationCountry)
        
        let arrival = PlaceAtTime(place: destination, timestamp: arrivalTime?.ISO8601TimeString())
        
        let trip = Trip(departure: departure, arrival: arrival, modesOfTransportation: modesOfTransportation)
        
        return trip
    }
}
