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
    public private(set) var applicationToken: String!
    public private(set) var applicationName: String!
    public private(set) var applicationVersion: String?
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Computed Property
    // ------------------------------------------------------------------------------------------
    public var loggingEnabled: Bool? {
        
        didSet(oldloggingEnabled) {
            
            if let configuration = EventCollectionKit.sharedInstance.configuration {
                
                let versionString = configuration.applicationVersion ?? "Version not set"
                
                Logger.printString(string: "Token: " + configuration.applicationToken + "\n" +
                                            "Name: " + configuration.applicationName + "\n" +
                                            "Version: " + versionString + "\n")
            }
        }
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Initializer
    // ------------------------------------------------------------------------------------------
    convenience init(applicationToken: String, applicationName: String, applicationVersion: String?) {
    
        self.init()
        
        self.loggingEnabled = false
        
        self.applicationToken = applicationToken
        self.applicationName = applicationName
        self.applicationVersion = applicationVersion
    }
}
