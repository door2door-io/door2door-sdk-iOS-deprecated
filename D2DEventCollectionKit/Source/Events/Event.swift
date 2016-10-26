//
//  Event.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 25/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


public enum Stage {
    
    case create
}


public class Event: NSObject {

    public fileprivate(set) var stage: Stage?
    public fileprivate(set) var timeStamp: Date?
    public fileprivate(set) var actor: Person?
    
    public override init() {}
}
