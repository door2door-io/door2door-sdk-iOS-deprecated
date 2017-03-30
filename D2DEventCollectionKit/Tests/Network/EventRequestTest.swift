//
//  EventRequestTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 04/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class EventRequestTest: XCTestCase {
    
    func testEventRequestBaseSetup() {
    
        let testPayload = Data()
        
        EventCollectionKit.register(applicationToken: "test_application_token",
                                    applicationName: "test_application_name",
                                    applicationVersion: "test_application_version")

        
        let request = EventRequest(url: URL(string: EventRequest.baseURLString())!,
                                   jsonPayload: testPayload)
        
        guard let url = request.url else {
        
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(url.absoluteURL.absoluteString == "https://events.d2di.net")
        XCTAssertEqual(request.allHTTPHeaderFields?["Authorization"],
                       "Bearer test_application_token")
    }
}
