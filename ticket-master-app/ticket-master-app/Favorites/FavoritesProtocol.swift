//
//  FavoritesProtocol.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

protocol FavoritesViewProtocol: class {
    
    var presenter: FavoritesPresenterProtocol? {get set}
    func showEvents()
    
}

protocol FavoritesPresenterProtocol: class {
    
    var view: FavoritesViewProtocol? {get set}
    func getEvents() -> Array<Event>
    func getData()
    func deleteFavorite(event:Event)
    
}

protocol FavoritesModelProtocol: class {
    
}
