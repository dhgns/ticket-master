//
//  FavoritesViewModel.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

class FavoritesPresenter : FavoritesPresenterProtocol {
    
    var view: FavoritesViewProtocol?
    
    var favorites:Array<Event>
    
    init() {
        favorites = Array()
    }
    
    func getEvents() -> Array<Event> {
        return favorites
    }
    
    func getData() {
        view?.showEvents()
    }
    
    func deleteFavorite(event: Event) {
        
    }
    
    
    
    
    
    
}
