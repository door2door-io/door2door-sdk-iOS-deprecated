//
//  NetworkManager.swift
//  D2DEventCollectionKit
//
//  Created by Elmar Tampe on 11/10/2016.
//  Copyright © 2016 Door2Door GmbH. All rights reserved.
//

import Foundation

class NetworkManager {
    
    let dataSession = URLSession(configuration: .default)
    
    func send(event: Event) {
        
        let jsonDict = event.jsonRepresentation()
        
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: jsonDict as Any, options: .prettyPrinted)
            
            let eventRequest = EventRequest(jsonPayload:jsonData)
            
            let eventTask = self.dataSession.dataTask(with: eventRequest as URLRequest) { data, response, error in

                if let error: Error = error {
            
                    print(error.localizedDescription)
                }
                else {
                        
                }
            }
                    
            eventTask.resume()

        } catch  {
            
            print("Fucking Error!")
        }
    }
}
