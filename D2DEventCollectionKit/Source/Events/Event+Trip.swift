//
//  Event+Trip.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 13/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

extension Event {
    
    class func tripEvent() -> Event? {
        
        let event = Event()
        
        guard var payload = event.jsonPayload else {
            
            return nil
        }
        
        return event
    }
}
