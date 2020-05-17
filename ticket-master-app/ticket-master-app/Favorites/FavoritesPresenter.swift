//
//  FavoritesViewModel.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

class FavoritesPresenter : FavoritesPresenterProtocol {
    func deleteFavorite(event: EventDAO) {
        if(EventsDB.removeEvent(event: event).result == true){
            getData()
        }
    }
    
    
    var view: FavoritesViewProtocol?
    
    var favorites:Array<EventDAO>
    
    init() {
        favorites = Array()
    }
    
    func getEvents() -> Array<EventDAO> {
        return favorites
    }
    
    func getData() {
        let events = EventsDB.retrieAllEvents().data as! Array<EventDAO>
        favorites = events
        view?.showEvents()
        
    }
    
    
    
    
    
    
    
}
