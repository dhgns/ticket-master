//
//  EventsProtocol.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

protocol EventsViewProtocol: class {
    func showEvents(events:Array<Event>)
}

protocol EventsViewModelProtocol: class {
    func getEventsByCategory(category:String)
    func getEventsByKeyword(keyword:String,category:String)
    
    
}

protocol EventsModelProtocol: class {
    
}
