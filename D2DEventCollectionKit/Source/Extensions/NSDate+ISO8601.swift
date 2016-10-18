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
    // MARK: Static Date Formatter
    // ------------------------------------------------------------------------------------------
    @available(iOS 10.0, *)
    private static var ISO8601DateFormatter_iOS10: ISO8601DateFormatter = {
        
        let dateFormatter = ISO8601DateFormatter()
        
        return dateFormatter
    }()
    
    
    private static var ISO8601DateFormatter_iOS9: DateFormatter = {
    
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        return dateFormatter
    }()
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: ISO8601 Date String
    // ------------------------------------------------------------------------------------------
    public static func ISO8601TimeStampString() -> String {
        
        return Date().ISO8601TimeString()
    }
    
    
    public func ISO8601TimeString() -> String {
        
        if #available(iOS 10.0, *) {
            
            return Date.ISO8601DateFormatter_iOS10.string(from: self)
        }
        
        return Date.ISO8601DateFormatter_iOS9.string(from: self)
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: ISO8601 Date Object
    // ------------------------------------------------------------------------------------------
    public static func dateFromISO8601String(dateString: String) -> Date? {
        
        if #available(iOS 10.0, *) {
            
            return Date.ISO8601DateFormatter_iOS10.date(from: dateString)
        }
        
        return Date.ISO8601DateFormatter_iOS9.date(from: dateString)
    }
}
