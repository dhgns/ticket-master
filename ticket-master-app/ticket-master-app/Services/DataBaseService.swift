//
//  DataBaseService.swift
//  ticket-master-app
//
// //  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import RealmSwift

class EventsDB: FavoritesEventsDAO {
    
    static var realm: Realm?
    
    init() {
        do {
            try EventsDB.realm = Realm()
        } catch  {
            print (error)
        }
    }

    static func insertEvent(event: EventDAO)-> EventDAOQueryResult {
                
        do {
            
            try EventsDB.realm?.write {
                EventsDB.realm?.add(event)
            }
        } catch {
            print (error)
            return EventDAOQueryResult(data: nil, result: false)
        }
        
        return EventDAOQueryResult(data: nil, result: true)
        
    }
    
    static func removeEvent(event: EventDAO) -> EventDAOQueryResult {
    
        
        do {
            try EventsDB.realm?.write {
                EventsDB.realm?.delete(event)
            }
        } catch {
            print (error)
            return EventDAOQueryResult(data: nil, result: false)
        }
        
        return EventDAOQueryResult(data: nil, result: true)
        
    }
    
    static func retrieAllEvents() -> EventDAOQueryResult {
        
        let events: Array<EventDAO>?
        
        do {
            events = EventsDB.realm?.objects(EventDAO.self).reversed()
        } catch  {
            print(error)
            return EventDAOQueryResult(data: nil, result: false)
        }
        
        return EventDAOQueryResult(data: events, result: true)
        
    }
    
    
    

    
    
}
