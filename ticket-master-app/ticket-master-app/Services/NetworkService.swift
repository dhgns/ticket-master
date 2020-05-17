//
//  NetworkService.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let baseURL = "https://app.ticketmaster.com/discovery/v2/events.json?countryCode=ES&sort=date,name,asc&locale=*"
    static let apiKey = "nD79qCECCZYDQSCTemBcXhWvjlwte1LG"
    
    class func getEvents(page: Int, completionhandler:@escaping (EventsModel) -> ()) {
        
        _ = AF.request(baseURL,method: .get, parameters: ["page":page, "apikey":apiKey])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    print("Validation Successful")
                    var data: EventsModel
                    do {
                        data = try JSONDecoder.init().decode(EventsModel.self, from: response.data!)
                        completionhandler(data)
                    } catch  {
                        print (error)
                    }
            
                case let .failure(error):
                    print(error)
                }
        }
    
        
    }
    
    class func getEventsByCategory(page: Int,category:String,segmentId:String, completionhandler:@escaping (EventsModel) -> ()) {
        
       
        _ = AF.request(baseURL,method: .get, parameters: ["segmentId":segmentId, "page":page, "apikey":apiKey])
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
    
                switch response.result {
                    
                case .success:
                        print("Validation Successful")
                        var data: EventsModel
                        do {
                            data = try JSONDecoder.init().decode(EventsModel.self, from: response.data!)
                            completionhandler(data)
                        } catch  {
                            print (error)
                        }
                
                    case let .failure(error):
                        print(error)
                    }
        }
        
       
    }
    
    class func getEventsByKeyword(page: Int, segmentId:String,keyword:String?, completionhandler:@escaping (EventsModel) -> ()) {
           
    
        _ = AF.request(baseURL,method: .get, parameters: ["segmentId":segmentId,"keyword":keyword, "page":page, "apikey":apiKey])
               .validate(statusCode: 200..<300)
               .validate(contentType: ["application/json"])
               .responseData { response in
                   
                   
                   switch response.result {
                       
                   case .success:
                           print("Validation Successful")
                           var data: EventsModel
                           do {
                               data = try JSONDecoder.init().decode(EventsModel.self, from: response.data!)
                               completionhandler(data)
                           } catch  {
                               print (error)
                           }
                   
                       case let .failure(error):
                           print(error)
                       }
           }
           
    }
    
    class func getEventsLocation(latitude: Double,longitude:Double,radius:String,page:Int, completionhandler:@escaping (EventsModel) -> ()) {
           
        let location = String(latitude)+","+String(longitude)
        _ = AF.request(baseURL,method: .get, parameters: ["radius":radius,"unit":"km", "geoPoint":location,"page":page, "apikey":apiKey])
               .validate(statusCode: 200..<300)
               .validate(contentType: ["application/json"])
               .responseData { response in
                   
                   
                   switch response.result {
                       
                   case .success:
                           print("Validation Successful")
                           var data: EventsModel
                           do {
                               data = try JSONDecoder.init().decode(EventsModel.self, from: response.data!)
                               completionhandler(data)
                           } catch  {
                               print (error)
                           }
                   
                       case let .failure(error):
                           print(error)
                       }
           }
           
       }
    
    
}
