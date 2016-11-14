//
//  ActionTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 14/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class ActionTest: XCTestCase {
    
    
    func testMapSearchActionEnumToStringValue() {
        
        let action = Action.search
        
        XCTAssertTrue(action.stringRepresentation() == "search")
    }
    
    
    func testMapInterestActionEnumToStringValue() {
        
        let action = Action.interest
        
        XCTAssertTrue(action.stringRepresentation() == "interest")
    }
    
    
    func testMapBookActionEnumToStringValue() {
        
        let action = Action.book
        
        XCTAssertTrue(action.stringRepresentation() == "book")
    }
    
    
    func testMapBeginActionEnumToStringValue() {
        
        let action = Action.begin
        
        XCTAssertTrue(action.stringRepresentation() == "begin")
    }
    
    
    func testMapPayActionEnumToStringValue() {
        
        let action = Action.pay
        
        XCTAssertTrue(action.stringRepresentation() == "pay")
    }
    
    
    func testMapEndActionEnumToStringValue() {
        
        let action = Action.end
        
        XCTAssertTrue(action.stringRepresentation() == "end")
    }
    
    
    func testMapCancelActionEnumToStringValue() {
        
        let action = Action.cancel
        
        XCTAssertTrue(action.stringRepresentation() == "cancel")
    }
}
