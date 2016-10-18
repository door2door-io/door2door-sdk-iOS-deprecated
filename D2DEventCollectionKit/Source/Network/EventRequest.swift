//
//  EventRequest.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 12/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


class EventRequest: NSMutableURLRequest {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Initialization
    // ------------------------------------------------------------------------------------------
    convenience init(jsonPayload: Data) {
    
        let baseURL = URL(string: "https://event.api.d2d.io")
        
        self.init(url: baseURL!, cachePolicy:.useProtocolCachePolicy, timeoutInterval: 60.0)
        
        self.setupHTTPHeader(jsonPayload: jsonPayload)
    }
    
    
    override init(url URL: URL, cachePolicy: NSURLRequest.CachePolicy, timeoutInterval: TimeInterval) {
    
        super.init(url: URL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: HTTP Header Fields
    // ------------------------------------------------------------------------------------------
    private func setupHTTPHeader(jsonPayload: Data) {
        
        self.httpMethod = "POST"
        
        self.httpBody = jsonPayload
        
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.addValue("application/json", forHTTPHeaderField: "Accept")
        self.addValue("gzip.identity", forHTTPHeaderField: "Accept-Encoding")
        self.addValue("YOUR_APP_TOKEN", forHTTPHeaderField: "X-User-Token")
    }
}
