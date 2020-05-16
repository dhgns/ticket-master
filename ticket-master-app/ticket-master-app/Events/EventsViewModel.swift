//
//  EventsViewModel.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

class EventsViewModel: EventsViewModelProtocol{
    
    weak var view:EventsViewProtocol?
    
    func getInitalData() {
        
    }
    

    
    func getEventsByCategory(category: String) {
        
    }
    
    func getEventsByKeyword(keyword: String, category: String) {
        
    }
    
    
    
    var events = Array<Event>()
    var keyword = ""
    
    
    
}
