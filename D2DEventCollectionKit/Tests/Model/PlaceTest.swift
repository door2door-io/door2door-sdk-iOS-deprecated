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
    
    func testValidateJSONOnlyWithRequiredParameterSet() {
        
        let client = Client(deviceID: nil,
                            plattform:nil,
                            application: "Test Application",
                            version: nil)
        
        guard let clientJSONRepresentation = client.jsonRepresentation() else {
            
            XCTAssertTrue(true)
            return
        }
        
        XCTAssertTrue(clientJSONRepresentation.count == 4)
        
        let person = Person(client: client)
        
        guard let personJSONRepresentation = person.jsonRepresentation() else {
            
            XCTAssertTrue(true)
            return
        }
        
        XCTAssertTrue(personJSONRepresentation.count == 1)
    }
}
