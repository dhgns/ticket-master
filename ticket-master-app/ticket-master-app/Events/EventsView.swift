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
        let event: Event? = presenter?.getEvents()[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventTableViewCell
        cell.setEvent(event: event)
        cell.delegate = self
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}


extension EventsView : EventCellDelegate{
    
    func didTapBuyTickets(url: String) {
        if let _url = URL(string: url){
            UIApplication.shared.open(_url)
        }
    }
    func didTapAddToFavorites(event: Event) {
        
    }
}
