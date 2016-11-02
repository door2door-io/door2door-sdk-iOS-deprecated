//
//  EventRequest+TripSearch.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 02/11/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


extension EventRequest {

    // ------------------------------------------------------------------------------------------
    // MARK: Trip Search Request Object
    // ------------------------------------------------------------------------------------------
    public class func tripSearchRequest(jsonPayload: Data) -> EventRequest {
        
        let request = EventRequest(url: URL(string: EventRequest.baseURLString() + "/v1/trips")!,
                                   jsonPayload: jsonPayload)
        
        request.httpMethod = "POST"
        
        return request
    }
}
