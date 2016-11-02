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
        - Parameter applicationName: The name of your application.
        - Parameter applicationVersion: The version number of your application.
    */
    static func register(applicationToken: String, applicationName: String, applicationVersion: String)

    
    /**
        For debugging purposes. You can enable logging in the terminal, if you set the logging to **true**, evey
                                collection event is printed in the terminal. 
                                **Logging is disabled by default.**
     
        - Parameter logginEnabled:  A boolean value to determine if logging is enabled or not. To enable logging set
                                    the value to **true**.
     */
    static func enableLogging(logginEnabled: Bool)
    
    
    /**
        Sends an event object to the event collection backend and stores it. 
     
        - Parameter event:  A generic **Event** object. See documentation on **Event** for more information. See also
                            list of specific **Event** objects which can be send to the backend.
     */
    static func send(event: Event)
}

