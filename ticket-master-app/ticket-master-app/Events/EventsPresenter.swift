//
//  EventsViewModel.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

class EventsPresenter: EventsPresenterProtocol {
    
    weak var view:EventsViewProtocol?

    func setCategory(category: Int) {
        currentCategory = Constants.categories[category]
    }
    
    var eventsData: Array<Event>
    var currentPage: Int
    var currentCategory: Category?
    
    init() {
        currentPage = 0
        currentCategory = Constants.categories[0]
        eventsData = Array()
    }
    
    func getEvents() -> Array<Event> {
        return eventsData
    }
    
    func getInitalData() {
        
        NetworkManager.getEvents(page: 0, completionhandler: { (response)  in
            self.eventsData = response.embedded.events
            self.view?.showEvents()
        })
        
    }
    
    func getEventsByKeyword(keyword: String?) {
        
        if(keyword == nil){
            
            getInitalData()
            
        }else {
            
            NetworkManager.getEventsByKeyword(page: 0, segmentId: currentCategory!.id, keyword: keyword!, completionhandler: { (response)  in
                self.eventsData = response.embedded.events
                self.view?.showEvents()
            })
            
        }
        
    }
    
    func getCategories() -> Array<Category>{
        return Constants.categories
    }
    
    
    func getEventsByCategory(category: String) {
        
    }
    

    
    

    
    
}
