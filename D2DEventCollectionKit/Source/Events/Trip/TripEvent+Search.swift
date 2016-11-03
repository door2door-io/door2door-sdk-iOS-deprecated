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
    public class func tripSearchEvent(originLatitude: Float,
                                      originLongitude: Float,
                                      originName: String?,
                                      originStreet: String?,
                                      originCity: String?,
                                      originPostalCode: String?,
                                      originCountry: String?,
                                      destinationLatitude: Float,
                                      destinationLongitude: Float,
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
        
        let destination = Place(latitude: destinationLatitude,
                                longitude: destinationLongitude,
                                name: destinationName,
                                street: destinationStreet,
                                city: destinationCity,
                                postalCode: destinationPostalCode,
                                country: destinationCountry)
        
        let trip = Trip(origin: origin, destination: destination)
        
        let tripSearchEvent = TripEvent(stage: .create, trip: trip, eventType: .tripSearch)
        
        return tripSearchEvent
    }
}
