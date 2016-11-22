//
//  TripEventTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 14/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class TripEventTest: XCTestCase {
    
    var trip: Trip!
    var modesOfTransportationAsNumbers: [NSNumber]!

    override func setUp() {
        
        super.setUp()
        
        self.setupTripModel()
        self.setupTransportationOptionsAsNumbers()
    }
    
    
    func setupTripModel() {
        
        let origin = Place(latitude: 52.5300641,
                           longitude: 13.4008385,
                           name: "Door2Door HQ",
                           street: "Torstrasse 109",
                           city: "Berlin",
                           postalCode:"10119",
                           country: "Germany")
        
        let destination = Place(latitude: 52.5230554,
                                longitude: 13.4122575,
                                name: "Alexanderplatz",
                                street: "Alexanderplatz",
                                city: "Berlin",
                                postalCode:"10178",
                                country: "Germany")
        
        let departure = PlaceAtTime(place: origin, timestamp: nil)
        
        let arrival = PlaceAtTime(place: destination, timestamp: nil)
        
        self.trip = Trip(departure: departure, arrival: arrival, modesOfTransportation: [ModesOfTransportation.taxi])
    }


    func testValidateJSONOnlyWithRequiredParameterSet() {
        
        let event = TripEvent(action: .cancel, trip: self.trip)

        XCTAssertTrue(event.jsonRepresentation().count == 4)
    }
    
    
    func setupTransportationOptionsAsNumbers() {
    
        //TODO: Add the rest of the values here. Swift is strange! 
        self.modesOfTransportationAsNumbers = [NSNumber(value: 0), NSNumber(value: 1), NSNumber(value: 2), NSNumber(value: 3)]
    }
    
    
    func testObjectiveCModeOfTransportationEnumMapping() {
    
        let modesOfTransportationEnums =
                TripEvent.map(modesOfTransportationsNumberRepresentation: self.modesOfTransportationAsNumbers)
        
        XCTAssertTrue(modesOfTransportationEnums[0] == ModesOfTransportation.train)
        XCTAssertTrue(modesOfTransportationEnums[1] == ModesOfTransportation.walk)
        XCTAssertTrue(modesOfTransportationEnums[2] == ModesOfTransportation.publicTransport)
        XCTAssertTrue(modesOfTransportationEnums[3] == ModesOfTransportation.carSharing)
//        XCTAssertTrue(modesOfTransportationEnums[4] == ModesOfTransportation.bikeSharing)
//        XCTAssertTrue(modesOfTransportationEnums[5] == ModesOfTransportation.taxi)
//        XCTAssertTrue(modesOfTransportationEnums[6] == ModesOfTransportation.privateBike)
//        XCTAssertTrue(modesOfTransportationEnums[7] == ModesOfTransportation.rideSharing)
//        XCTAssertTrue(modesOfTransportationEnums[8] == ModesOfTransportation.other)
    }
}
