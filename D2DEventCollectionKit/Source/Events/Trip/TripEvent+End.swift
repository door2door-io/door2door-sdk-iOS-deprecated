//
//  TripEvent+End.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 11/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

extension TripEvent {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Convenience Initializer
    // ------------------------------------------------------------------------------------------
    public class func tripEndEvent(modesOfTransportation: [ModesOfTransportation],
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
        
        let trip = Trip.trip(modesOfTransportation: modesOfTransportation,
                             departureTime: departureTime,
                             originLatitude: originLatitude,
                             originLongitude: originLongitude,
                             originName: originName,
                             originStreet: originStreet,
                             originCity: originCity,
                             originPostalCode: originPostalCode,
                             originCountry: originCountry,
                             arrivalTime:arrivalTime,
                             destinationLatitude: destinationLatitude,
                             destinationLongitude: destinationLongitude,
                             destinationName: destinationName,
                             destinationStreet: destinationStreet,
                             destinationCity: destinationCity,
                             destinationPostalCode: destinationPostalCode,
                             destinationCountry: destinationCountry)
        
        return TripEvent(action: .end, trip: trip)
    }
}
