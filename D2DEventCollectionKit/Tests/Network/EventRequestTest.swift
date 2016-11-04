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
        
        let request = EventRequest(url: URL(string: EventRequest.baseURLString())!,
                                   jsonPayload: testPayload)
        
        guard let url = request.url else {
        
            XCTAssertTrue(false)
            return
        }
        
        XCTAssertTrue(url.absoluteURL.absoluteString == "https://events.d2di.net")
    }
}
