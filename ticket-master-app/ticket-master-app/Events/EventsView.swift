//
//  EventsView.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit
class EventsView: UIViewController, EventsViewProtocol {
    
    override func viewDidLoad() {
        
        print("ey")

        NetworkManager.getEvents(page: 0, completionhandler: { (response)  in
            var events = response
            print(events)
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ey")

    }
    
    
}
