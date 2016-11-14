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

    override func setUp() {
        
        super.setUp()
        
        self.setupTripModel()
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

    
    func testMapSearchActionEnumToStringValue() {
        
        let event = TripEvent(action: .search, trip: self.trip)
        
        XCTAssertTrue(event.action.stringRepresentation() == "search")
    }
    
    
    func testMapInterestActionEnumToStringValue() {
        
        let event = TripEvent(action: .interest, trip: self.trip)
        
        XCTAssertTrue(event.action.stringRepresentation() == "interest")
    }
    
    
    func testMapBookActionEnumToStringValue() {
        
        let event = TripEvent(action: .book, trip: self.trip)
        
        XCTAssertTrue(event.action.stringRepresentation() == "book")
    }
    
    
    func testMapBeginActionEnumToStringValue() {
        
        let event = TripEvent(action: .begin, trip: self.trip)
        
        XCTAssertTrue(event.action.stringRepresentation() == "begin")
    }
    
    
    func testMapPayActionEnumToStringValue() {
        
        let event = TripEvent(action: .pay, trip: self.trip)
        
        XCTAssertTrue(event.action.stringRepresentation() == "pay")
    }
    
    
    func testMapEndActionEnumToStringValue() {
        
        let event = TripEvent(action: .end, trip: self.trip)

        XCTAssertTrue(event.action.stringRepresentation() == "end")
    }
    
    
    func testMapCancelActionEnumToStringValue() {
        
        let event = TripEvent(action: .cancel, trip: self.trip)
        
        XCTAssertTrue(event.action.stringRepresentation() == "cancel")
    }
    
    
    func testValidateJSONOnlyWithRequiredParameterSet() {
        
        let event = TripEvent(action: .cancel, trip: self.trip)

        XCTAssertTrue(event.jsonRepresentation().count == 4)
    }
}
