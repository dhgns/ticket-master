//
//  EventsProtocol.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

protocol EventsViewProtocol: class {
    func showEvents(events:Array<Event>)
    var viewModel:EventsViewModelProtocol? {get set}
}

protocol EventsViewModelProtocol: class {
    func getEventsByCategory(category:String)
    func getEventsByKeyword(keyword:String,category:String)
    func getInitalData()
    var view:EventsViewProtocol? {get set}
}

protocol EventsModelProtocol: class {
    
}
