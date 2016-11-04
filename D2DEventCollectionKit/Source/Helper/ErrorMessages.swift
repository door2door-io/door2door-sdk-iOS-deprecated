//
//  ErrorMessages.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 04/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

class ErrorMessages {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Registration Errors
    // ------------------------------------------------------------------------------------------
    public class func registrationErrorDescription() -> String {
        
        return "[!]Initialization Error. You need to register the <EventCollectionKit> before sending events. \n" +
                "Use <public class func register(applicationToken: String, applicationName: String," +
                "applicationVersion: String?)> to register the SDK and start collecting data."
    }
}
