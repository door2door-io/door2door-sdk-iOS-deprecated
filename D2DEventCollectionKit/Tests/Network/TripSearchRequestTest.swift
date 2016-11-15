//
//  TripSearchRequestTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 04/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class TripSearchRequestTest: XCTestCase {
    
    func testTripSearchRequestBaseSetup() {
        
        let testPayload = Data()
        
        let request = EventRequest.tripSearchRequest(jsonPayload: testPayload)
        
        XCTAssertTrue(request.httpMethod == "POST")
        
        guard let url = request.url else {
            
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(url.absoluteURL.absoluteString == "https://events-dev.d2di.net/v1/trips")
    }
}

