//
//  EventsView.swift
//  ticket-master-app
//
//  Created by Delfín Hernández Gómez on 14/05/2020.
//  Copyright © 2020 Delfín Hernández Gómez. All rights reserved.
//

import Foundation
import UIKit
class EventsView: UIViewController, EventsViewProtocol {
    
    override func viewDidLoad() {
        
        print("ey")

        NetworkManager.getEvents(page: 1, completionhandler: { (response)  in
            var events = response
            print(events)
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ey")

    }
    
    
}
