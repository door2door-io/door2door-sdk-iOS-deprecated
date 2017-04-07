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
    convenience init(url: URL, jsonPayload: Data) {
        
        self.init(url: url, cachePolicy:.useProtocolCachePolicy, timeoutInterval: 60.0)
        
        self.addHTTPHeaderFields()
        self.setJSONBody(jsonPayload: jsonPayload)
    }
    
    
    override init(url URL: URL, cachePolicy: NSURLRequest.CachePolicy, timeoutInterval: TimeInterval) {
        
        super.init(url: URL, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Base URL
    // ------------------------------------------------------------------------------------------
    public class func baseURLString() -> String {
        
        return "https://events.d2di.net"
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: JSON Body
    // ------------------------------------------------------------------------------------------
    private func setJSONBody(jsonPayload: Data) {
        
        self.httpBody = jsonPayload
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: HTTP Header
    // ------------------------------------------------------------------------------------------
    private func addHTTPHeaderFields() {
        
        self.addJsonHeaderFields()
        self.addAcceptEncodingHeaderField()
        self.addAuthorizationHeaderField()
    }
    
    
    private func addJsonHeaderFields() {
        
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.addValue("application/json", forHTTPHeaderField: "Accept")
    }
    
    
    private func addAcceptEncodingHeaderField() {
        
        self.addValue("gzip.identity", forHTTPHeaderField: "Accept-Encoding")
    }
    
    
    private func addAuthorizationHeaderField() {
        
        if let applicationToken = EventCollectionKit.sharedInstance
            .configuration?
            .applicationToken {
            
            self.addValue("Bearer \(applicationToken)", forHTTPHeaderField: "Authorization")
        }
    }
}
