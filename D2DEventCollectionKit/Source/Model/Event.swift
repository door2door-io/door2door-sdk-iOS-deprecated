//
//  Event.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 18/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


public class Event {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    public private(set) var timeStamp: Date?
    
    public private(set) var type: UIEventType?
    
    public private(set) var actor: Actor?

    
    public init() {
    
    }
    
    
    public func jsonData() -> Data? {
    
        return nil
    }
}
