//
//  EventCollectionKitProtocol.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 11/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

protocol EventCollectionKitProtocol {
    
    /**
        This method sets up the EventCollectionKit and register a given token to it.
     
        - Parameter withAppToken:A 32 character long string provided by D2D.
    */
    static func register(withAppToken: String)

    /**
        For debugging purposes. You can enable logging in the terminal, if you set the logging to **true**, evey
                                collection event is printed in the terminal. 
                                **Logging is disabled by default.**
     
        - Parameter logginEnabled:  A boolean value to determine if logging is enabled or not. To enable logging set
                                    the value to **true**.
     */
    static func enableLogging(logginEnabled: Bool)
}

