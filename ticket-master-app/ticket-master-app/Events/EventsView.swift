//
//  EventsView.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit
class EventsView: UIViewController, EventsViewProtocol {
    
    var viewModel: EventsViewModelProtocol?
    
    
    
    
    override func viewDidLoad() {
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didAppear")

    }
    
    
    
    func showEvents(events: Array<Event>) {
        
    }
    
    
}
