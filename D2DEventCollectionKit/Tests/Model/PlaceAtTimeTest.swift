//
//  PlaceAtTimeTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 09/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class PlaceAtTimeTest: XCTestCase {
    
    func testValidateJSONWithAllParameterSet() {
        
        let place = Place(latitude: 52.5300641,
                          longitude: 13.4008385,
                          name: "Door2Door HQ",
                          street: "Torstrasse 109",
                          city: "Berlin",
                          postalCode:"10119",
                          country: "Germany")
        
        guard let placeJsonRepresentation = place.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(placeJsonRepresentation.count == 7)
        
        
        let placeAtTime = PlaceAtTime(place: place, timestamp: nil)
        
        guard let placeAtTimejsonRepresentation = placeAtTime.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(placeAtTimejsonRepresentation.count == 2)
    }
    
}
