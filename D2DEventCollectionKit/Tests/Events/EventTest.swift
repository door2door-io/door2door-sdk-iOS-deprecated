//
//  EventTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 04/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class EventTest: XCTestCase {
    
    func testMapStageEnumToStringValue() {
        
        let client = Client(deviceID: "Device ID", plattform: "iOS", application: "Test Application", version: "1.0")
        let person = Person(client: client)
        let event = Event(stage: .create, actor: person, eventType: .tripSearch)
                
        XCTAssertTrue(event.stage.stringRepresentation() == "Create")
    }
}
