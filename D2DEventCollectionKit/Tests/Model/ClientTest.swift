//
//  ClientTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 03/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class ClientTest: XCTestCase {
    
    func testValidateJSONWithAllParameterSet() {
    
        let client = Client(deviceID: "device_id",
                            plattform: "plattform",
                            application: "application",
                            version: "version")
        
        guard let jsonRepresentation = client.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(jsonRepresentation.count == 4)
    }
    
    
    func testValidateJSONOnlyWithRequiredParameterSet() {
        
        let client = Client(deviceID: nil,
                            plattform:nil,
                            application: "Test Application",
                            version: nil)
        
        guard let jsonRepresentation = client.jsonRepresentation() else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(jsonRepresentation.count == 4)
    }
}
