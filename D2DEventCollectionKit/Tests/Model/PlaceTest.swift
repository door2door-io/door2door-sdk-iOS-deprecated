//
//  PlaceTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 03/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class PlaceTest: XCTestCase {
    
    func testValidateJSONWithAllParameterSet() {
        
        let place = Place(latitude: 52.5300641,
                          longitude: 13.4008385,
                          name: "Door2Door HQ",
                          street: "Torstrasse 109",
                          city: "Berlin",
                          postalCode:"10119",
                          country: "Germany")
        
        guard let jsonRepresentation = place.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(jsonRepresentation.count == 7)
    }
    
    
    func testValidateJSONOnlyWithRequiredParameterSet() {
        
        let place = Place(latitude: 52.5300641,
                          longitude: 13.4008385,
                          name: nil,
                          street: nil,
                          city: nil,
                          postalCode: nil,
                          country: nil)
        
        guard let jsonRepresentation = place.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(jsonRepresentation.count == 7)
    }
}
