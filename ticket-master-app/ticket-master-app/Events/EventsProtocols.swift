//
//  EventsProtocol.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

protocol EventsViewProtocol: class {
    
    var presenter:EventsPresenterProtocol? {get set}
    
    func showEvents()
    
}

protocol EventsPresenterProtocol: class {
    
    var view:EventsViewProtocol? {get set}

    func getEvents() -> Array<Event>
    func getInitalData()
    func setKeyword(keyword: String?)
    func setCategory(category: Int)
    
}

protocol EventsModelProtocol: class {
    
}
