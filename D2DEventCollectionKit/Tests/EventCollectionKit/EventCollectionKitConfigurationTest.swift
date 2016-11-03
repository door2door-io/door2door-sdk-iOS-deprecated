//
//  EventCollectionKitConfigurationTest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 19/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import XCTest

@testable import D2DEventCollectionKit

class EventCollectionKitConfigurationTest: XCTestCase {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Test Logging Configuration
    // ------------------------------------------------------------------------------------------
    func testConfigurationWithDefaultLoggingSetting() {
        
        let token = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let applicationName = "Test application"
        let applicationVersion = "1.0.0"
        
        let configuration = EventCollectionKitConfiguration.init(applicationToken: token,
                                                                 applicationName: applicationName,
                                                                 applicationVersion: applicationVersion)
        
        XCTAssertTrue(configuration.loggingEnabled == false)
    }
    
    
    func testConfigurationWithLoggingEnabled() {
        
        let token = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let applicationName = "Test application"
        let applicationVersion = "1.0.0"
        
        let configuration = EventCollectionKitConfiguration.init(applicationToken: token,
                                                                 applicationName: applicationName,
                                                                 applicationVersion: applicationVersion)
        
        configuration.loggingEnabled = true
        
        XCTAssertTrue(configuration.loggingEnabled == true)
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Test Input Validation
    // ------------------------------------------------------------------------------------------
    func testConfigurationWithInputEquality() {
        
        let token = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let applicationName = "Test application"
        let applicationVersion = "1.0.0"
        
        let configuration = EventCollectionKitConfiguration.init(applicationToken: token,
                                                                 applicationName: applicationName,
                                                                 applicationVersion: applicationVersion)
        
        XCTAssertTrue(configuration.applicationToken == token &&
                      configuration.applicationName == applicationName &&
                      configuration.applicationVersion == applicationVersion)
    }
}
