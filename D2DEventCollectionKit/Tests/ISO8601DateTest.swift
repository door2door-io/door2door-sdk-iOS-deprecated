//
//  ISO8601DateTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 13/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class ISO8601DateTest: XCTestCase {

    // ------------------------------------------------------------------------------------------
    // MARK: ISO8601 Tests
    // ------------------------------------------------------------------------------------------
    func testCreateISO8601TimeStampStringAndReverseIntoISO8601DateAgain() {
    
        let dateNow = Date()
        
        let timeStampString = Date.ISO8601TimeStampString()
        
        let reveresedDateFromString = Date.dateFromISO8601String(dateString:timeStampString)
        
        XCTAssertFalse(dateNow == reveresedDateFromString)
    }
}
