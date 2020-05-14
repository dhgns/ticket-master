//
//  NetworkService.swift
//  ticket-master-app
//
//  Created by Delfín Hernández Gómez on 14/05/2020.
//  Copyright © 2020 Delfín Hernández Gómez. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let baseURL = "https://app.ticketmaster.com/discovery/v2/events.json?"
    static let apiKey = "nD79qCECCZYDQSCTemBcXhWvjlwte1LG"
    
    class func getEvents(page: Int, completionhandler:@escaping (EventsResponse) -> ()) {
        
        var countryCode = "ES"
        var request = AF.request(baseURL,method: .get, parameters: ["keyword": "Salamanca", "countryCode": countryCode, "page":page, "apikey":apiKey])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                
                print(response.request)
                
                switch response.result {
                    
                case .success:
                    print("Validation Successful")
                    
                    var data: EventsResponse
                    do {
                        data = try JSONDecoder.init().decode(EventsResponse.self, from: response.data!)
                    } catch  {
                        print (error)
                    }
                    
                    do{
                        let responseData: EventsResponse = try JSONDecoder().decode(EventsResponse.self, from: response.data!)
                        completionhandler(responseData)
                        
                    }catch{
                        print(error)
                    }
        
                    
                case let .failure(error):
                    print(error)
                }
        }
        
        
        
    }
    
    
}
