//
//  EventsView.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit
class EventsView: UIViewController, EventsViewProtocol {
    
    
    let categories = [[
        "title":"Todos",
        "id": "0"
        ],[
        "title":"Diverso",
        "id":"KZFzniwnSyZfZ7v7n1"
        ],[
          "title":"Deporte",
          "id":"KZFzniwnSyZfZ7v7nE"
        ],[
          "title":"Música",
          "id":"KZFzniwnSyZfZ7v7nJ"
        ],[
          "title":"Arte y Teatro",
          "id":"KZFzniwnSyZfZ7v7na"
        ],
    
    ];
    
    override func viewDidLoad() {
        
        NetworkManager.getEvents(page: 0, completionhandler: { (response)  in
            let events = response
            print(events.embedded.events[0].name!)
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didAppear")

    }
    
    
    
    func showEvents(events: Array<Event>) {
        <#code#>
    }
    
    
}
