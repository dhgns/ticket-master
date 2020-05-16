//
//  EventsView.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit
class EventsView: UIViewController, EventsViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    var presenter: EventsPresenterProtocol?
    
    @IBOutlet var table: UITableView?
    
    override func viewDidLoad() {
        
        presenter?.getInitalData()
        
        table?.delegate = self
        table?.dataSource = self
                
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("didAppear")

    }
    
    func showEvents() {
        self.table?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getEvents().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = EventTableViewCell()
        
        cell.title?.text = "Er beti manda!"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    
    
}
