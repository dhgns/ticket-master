//
//  FavoritesProtocol.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

protocol FavoritesViewProtocol: class {
    
    var presenter: FavoritesPresenterProtocol? {get set}
    
    func showOKAlert()
    func showKOAlert()
    func showEvents()
    
}

protocol FavoritesPresenterProtocol: class {
    
    var view: FavoritesViewProtocol? {get set}
    
    func getData()
    func getEvents() -> Array<EventDAO>
    func deleteFavorite(event:EventDAO)
    
}

protocol FavoritesModelProtocol: class {
    
}

protocol FavoritesEventsDAO: class {
    
    static func insertEvent(event: EventDAO) -> EventDAOQueryResult
    static func removeEvent(event: EventDAO) -> EventDAOQueryResult
    static func retrieAllEvents() -> EventDAOQueryResult
    
}
