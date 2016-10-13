//
//  EventCollectionKitConfiguration.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 12/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

public class EventCollectionKitConfiguration {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public private(set) var applicationToken: String = ""
    public private(set) var applicationName: String = ""
    public private(set) var applicationVersion: String = ""
    
    public var loggingEnabled = false
    
    // ------------------------------------------------------------------------------------------
    // MARK: Initializer
    // ------------------------------------------------------------------------------------------
    convenience init(applicationToken: String, applicationName: String, applicationVersion: String) {
    
        self.init()
        
        self.applicationToken = applicationToken
        self.applicationName = applicationName
        self.applicationVersion = applicationVersion
    }
}