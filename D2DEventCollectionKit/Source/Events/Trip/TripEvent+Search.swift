//
//  TripEvent+Search.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 01/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

extension TripEvent {

    // ------------------------------------------------------------------------------------------
    // MARK: Convenience Initializer
    // ------------------------------------------------------------------------------------------
    public class func tripSearchEvent(modeOfTransportations: [ModeOfTransportations],
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
                                      destinationCountry: String?) -> TripEvent {
        
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
        
        let trip = Trip(departure: departure, arrival: arrival, modeOfTransportations: modeOfTransportations)
        
        let tripSearchEvent = TripEvent(stage: .search, trip: trip, eventType: .tripSearch)
        
        return tripSearchEvent
    }
}
