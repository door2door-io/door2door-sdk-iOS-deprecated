//
//  Logger.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 03/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

class Logger {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Console Logging
    // ------------------------------------------------------------------------------------------
    public class func printData(data: Data) {
    
        if Logger.isLoggingEnabled() {
            
            if let payloadString = String(data: data, encoding: String.Encoding.utf8) {
                
                print(payloadString)
            }
        }
    }
    
    
    public class func printString(string: String) {
        
        if Logger.isLoggingEnabled() {
            
            print(string)
        }
    }

    
    public class func printAnyObject(anyObject: Any) {
        
        if Logger.isLoggingEnabled() {
            
            print(anyObject)
        }
    }
    
    
    public class func printError(error: Error) {
        
        if Logger.isLoggingEnabled() {
            
            print(error)
        }
    }
    
    
    public class func printURLResponse(response: URLResponse) {
        
        if Logger.isLoggingEnabled() {
        
            print(response)
        }
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Helper
    // ------------------------------------------------------------------------------------------
    private class func isLoggingEnabled() -> Bool {

        if let configuration = EventCollectionKit.sharedInstance.configuration {
        
            if let enabled = configuration.loggingEnabled {
            
                return enabled
            }
        }
        
        return false
    }
}
