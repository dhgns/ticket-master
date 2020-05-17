//
//  EventsViewModel.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

class EventsPresenter: EventsPresenterProtocol {
        
    weak var view:EventsViewProtocol?
    
    var eventsData: Array<Event>

    var currentPage: Int
    var currentKeyword: String?
    var currentCategory: Category
    
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
            if let result = response.embedded?.events{
                self.eventsData = result
            }else{
                self.eventsData = Array()
            }
            self.view?.showEvents()
        })
        
    }
    
    func setCategory(category: Int) {
        currentCategory = Constants.categories[category]
        self.getNewEvents()
        
    }
    
    func setKeyword(keyword: String?) {
        self.currentKeyword = keyword
        self.getNewEvents()
        
    }
    
    func addToFavorites(event: Event) {
        //FIXME move this to utils
        var eventDAO = EventDAO(url: event.images[0].url, date: event.dates?.start.localDate, city: event.embedded.venues[0].city?.name, title: event.embedded.venues[0].name, location: event.embedded.venues[0].name)
        
        eventDAO = EventDAO(url: "http://", date: "Hoy", city: "Madrid", title: "Manno", location: "new")
        
        if(EventsDB.insertEvent(event: eventDAO).result == true){
            //view?.showError()
        }else {
            //view?.showAlert()
        }
            
        
    }
    
    func getCategories() -> Array<Category>{
        return Constants.categories
    }
    
    func getNewEvents(){
        
        if((self.currentCategory.id == Constants.categories[0].id) && (currentKeyword == nil)){
            NetworkManager.getEvents(page: currentPage, completionhandler: { (response)  in
                if let result = response.embedded?.events{
                    self.eventsData = result
                }else{
                    self.eventsData = Array()
                }
                
                self.view?.showEvents()
                
            })
        }
        if((self.currentCategory.id == Constants.categories[0].id) && (currentKeyword != nil)){
            NetworkManager.getEventsByKeyword(page: currentPage, keyword: currentKeyword!, completionhandler: { (response)  in
                if let result = response.embedded?.events{
                    self.eventsData = result
                }else{
                    self.eventsData = Array()
                }
                
                self.view?.showEvents()
                
            })
        }
        if((self.currentCategory.id != Constants.categories[0].id) && (currentKeyword == nil)){
            NetworkManager.getEventsByCategory(page: currentPage, segmentId: currentCategory.id, completionhandler: { (response)  in
                if let result = response.embedded?.events{
                    self.eventsData = result
                }else{
                    self.eventsData = Array()
                }
                
                self.view?.showEvents()
                
            })
        }
        if((self.currentCategory.id != Constants.categories[0].id) && (currentKeyword != nil)){
            NetworkManager.getEventsByKeyCat(page: currentPage, keyword: currentKeyword!, segmentId: currentCategory.id, completionhandler: { (response)  in
                if let result = response.embedded?.events{
                    self.eventsData = result
                }else{
                    self.eventsData = Array()
                }
                
                self.view?.showEvents()
                
            })
        }
        
       
    }
    
    
    
    

    
    

    
    
}
