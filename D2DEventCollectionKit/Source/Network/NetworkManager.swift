//
//  NetworkManager.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 11/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation


class NetworkManager {
    
    // ------------------------------------------------------------------------------------------
    // MARK: Properties
    // ------------------------------------------------------------------------------------------
    let dataSession = URLSession(configuration: .default)
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: Network Reqquest
    // ------------------------------------------------------------------------------------------
    func send(event: Event) {
        
        let jsonDict = event.jsonRepresentation()
        
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: jsonDict as Any, options: .prettyPrinted)

            self.printPayload(payloadData: jsonData)

            let eventRequest = self.requestForEventType(eventType: event.eventType, jsonPayload: jsonData)
            
            let eventTask = self.dataSession.dataTask(with: eventRequest as URLRequest) { data, response, error in
                
                if let error: Error = error {
            
                    self.printObject(object: error as Any)
                }
                else {
                    
                    self.printObject(object: response as Any)
                }
            }
                    
            eventTask.resume()

        } catch  {
            
            self.printObject(object: "JSON serialization failed." as Any)
        }
    }
    
    
    // ------------------------------------------------------------------------------------------
    // MARK: URLRequest Object by EventType
    // ------------------------------------------------------------------------------------------
    private func requestForEventType(eventType: EventType, jsonPayload: Data) -> EventRequest {
    
        switch eventType {
            case .tripSearch:
                return EventRequest.tripSearchRequest(jsonPayload: jsonPayload)
        }
    }
    
    // ------------------------------------------------------------------------------------------
    // MARK: Helper
    // ------------------------------------------------------------------------------------------
    private func printPayload(payloadData: Data) {
    
        if (EventCollectionKit.sharedInstance.configuration?.loggingEnabled)! {
            
            if let payloadString = String(data: payloadData, encoding: String.Encoding.utf8) {
            
                print(payloadString)
            }
        }
    }
    
    
    private func printObject(object: Any) {
    
        if (EventCollectionKit.sharedInstance.configuration?.loggingEnabled)! {
            
            print(object)
        }
    }
}
