//
//  Session.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 14/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

class Session {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Language Settings
    // ------------------------------------------------------------------------------------------
    public class func deviceLanguage() -> String? {
        
        return Locale.current.languageCode
    }
    
    
    public class func country() -> String? {
        
        return Locale.current.regionCode
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Device Settings
    // ------------------------------------------------------------------------------------------
    public class func deviceType() -> String? {
        
        if let key = "hw.machine".cString(using: String.Encoding.utf8) {
            
            var size: Int = 0
            sysctlbyname(key, nil, &size, nil, 0)
            var machine = [CChar](repeating: 0, count: Int(size))
            sysctlbyname(key, &machine, &size, nil, 0)
            
            if machine.count > 0 {
            
                return String.init(cString: machine)
            }
        }
        
        return nil
    }
    
    
    public class func osVersion() -> String? {
        
        return UIDevice().systemVersion
    }
    
    
    public class func plattform() -> String? {
        
        return "iOS"
    }
    

    // ------------------------------------------------------------------------------------------
    // MARK: Identifier Settings
    // ------------------------------------------------------------------------------------------
    public class func deviceID() -> String? {
        
        if let identifier = UIDevice.current.identifierForVendor {
            
             return identifier.uuidString
        }
        
        return nil
    }
    
    
    public class func uuid() -> String? {
        
       return UUID().uuidString
    }
}
