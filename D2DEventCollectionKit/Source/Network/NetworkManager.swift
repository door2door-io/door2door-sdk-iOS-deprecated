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

            Logger.printData(data: jsonData)
            
            let eventRequest = self.requestForEventType(eventType: event.eventType, jsonPayload: jsonData)
            
            let eventTask = self.dataSession.dataTask(with: eventRequest as URLRequest) { data, response, error in
                
                if let error: Error = error {
            
                    Logger.printError(error: error)
                }
                else {
                    
                    if let response = response {
                    
                        Logger.printURLResponse(response: response)
                    }
                }
            }
                    
            eventTask.resume()

        } catch  {
            
            Logger.printString(string: "JSON serialization failed.")
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
}
