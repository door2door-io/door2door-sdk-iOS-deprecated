//
//  RequestHeader.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 11/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

class RequestHeader {
    
    class func requestHeaderDictionary() -> Dictionary<String, String> {
        
        var headerDictionary: Dictionary <String, String> = Dictionary()
        
        headerDictionary["Accept"] = "application/json"
        headerDictionary["Accept-Encoding"] = "gzip.identity"
        headerDictionary["User-Agent"] = "YOUR_USER_AGENT_HERE"
        headerDictionary["X-User-Token"] = "YOUR_APP_TOKEN"
        
        return headerDictionary
    }
}
