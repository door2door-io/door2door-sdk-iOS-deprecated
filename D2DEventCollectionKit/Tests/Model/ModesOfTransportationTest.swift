//
//  ModesOfTransportationTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 14/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class ModesOfTransportationTest: XCTestCase {
    
    func testTaxiEnumMapping() {
    
        let mode = ModesOfTransportation.taxi
        
        XCTAssert(mode.stringRepresentation() == "taxi")
    }
    
    
    func testTrainEnumMapping() {
        
        let mode = ModesOfTransportation.train
        
        XCTAssert(mode.stringRepresentation() == "train")
    }
    
    
    func testPublicTransportEnumMapping() {
        
        let mode = ModesOfTransportation.publicTransport
        
        XCTAssert(mode.stringRepresentation() == "public_transport")
    }
    
    
    func testCarSharingEnumMapping() {
        
        let mode = ModesOfTransportation.carSharing
        
        XCTAssert(mode.stringRepresentation() == "car_sharing")
    }
    
    
    func testBikeSharingEnumMapping() {
        
        let mode = ModesOfTransportation.bikeSharing
        
        XCTAssert(mode.stringRepresentation() == "bike_sharing")
    }
    
    
    func testPrivateBikeEnumMapping() {
        
        let mode = ModesOfTransportation.privateBike
        
        XCTAssert(mode.stringRepresentation() == "private_bike")
    }
    
    
    func testRideSharingEnumMapping() {
        
        let mode = ModesOfTransportation.rideSharing
        
        XCTAssert(mode.stringRepresentation() == "ride_sharing")
    }
    
    
    func testOtherEnumMapping() {
        
        let mode = ModesOfTransportation.other
        
        XCTAssert(mode.stringRepresentation() == "other")
    }
}
