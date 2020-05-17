//
//  FavoritesViewModel.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

class FavoritesPresenter : FavoritesPresenterProtocol {
    
    var view: FavoritesViewProtocol?
    
    var favorites:Array<EventDAO>
    
    init() {
        favorites = Array()
    }
    
    func getEvents() -> Array<EventDAO> {
        return favorites
    }
    
    func getData() {
        
        var events = EventsDB.retrieAllEvents().data
        view?.showEvents()
    }
    
    func deleteFavorite(event: Event) {
        
    }
    
    
    
    
    
    
}
