//
//  NSDate+ISO8601.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 13/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

extension Date {

    // ------------------------------------------------------------------------------------------
    // MARK: Date Formatter
    // ------------------------------------------------------------------------------------------
    private static var ISO8601DateFormatter: DateFormatter = {
    
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        return dateFormatter
    }()
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: ISO8601 Date Strings
    // ------------------------------------------------------------------------------------------
    public static func ISO8601TimeStampString() -> String {
        
        return Date().ISO8601TimeString()
    }
    
    
    public func ISO8601TimeString() -> String {
        
        return Date.ISO8601DateFormatter.string(from: self).appending("Z")
    }
}
