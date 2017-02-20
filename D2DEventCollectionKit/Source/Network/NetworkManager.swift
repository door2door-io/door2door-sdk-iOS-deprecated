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

            self.printRequestDivider()
            Logger.printData(data: jsonData)
            
            let eventRequest = EventRequest.tripSearchRequest(jsonPayload: jsonData)
            
            let eventTask = self.dataSession.dataTask(with: eventRequest as URLRequest) { data, response, error in
                
                if let error: Error = error {
            
                    Logger.printError(error: error)
                }
                else {
                    
                    if let response = response {
                    
                        let httpResponse = response as! HTTPURLResponse

                        if httpResponse.statusCode == 202 {
                        
                            self.printResponseDivider()
                            Logger.printString(string: "Succcessfully send event data.")
                        }
                        else {
                        
                            if let data = data {
                            
                                do {
                                    let responseBody = try JSONSerialization.jsonObject(with: data,
                                                                                        options: .mutableContainers)
                                    
                                    self.printResponseDivider()
                                    Logger.printAnyObject(anyObject: responseBody)
                                }
                                catch {
                                
                                    Logger.printString(string: "Response body parsing failed.")
                                }
                            }
                        }
                    }
                }
            }
                    
            eventTask.resume()
            self.dataSession.finishTasksAndInvalidate()

        } catch  {
            
            Logger.printString(string: "JSON serialization failed.")
        }
    }
    
    // ------------------------------------------------------------------------------------------
    // MARK: Helper
    // ------------------------------------------------------------------------------------------
    fileprivate func printResponseDivider() {
        
        Logger.printString(string: " ################################################# \n" +
                                   " **************** R E S P O N S E **************** \n" +
                                   " ################################################# \n")
    }
    
    fileprivate func printRequestDivider() {
        
        Logger.printString(string: " ############################################### \n" +
                                   " **************** R E Q U E S T **************** \n" +
                                   " ############################################### \n")
    }
}
