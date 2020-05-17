//
//  EventsView.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit
class EventsView: UIViewController, EventsViewProtocol, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var presenter: EventsPresenterProtocol?
    
    @IBOutlet var table: UITableView?
    @IBOutlet var segment:UISegmentedControl?
    @IBOutlet weak var searchBar: UISearchBar?

    
    override func viewDidLoad() {
        
        presenter?.getInitalData()
        
        table?.delegate = self
        table?.dataSource = self
        
        searchBar?.delegate = self
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func showOKAlert() {
        let alert = UIAlertController(title: "Evento añadido a Favoritos", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert,animated: true)
        
    }
    func showKOAlert(){
        let alert = UIAlertController(title: "Error", message: "Ha ocurrido un error durante el guardado...", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert,animated: true)
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
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.setKeyword(keyword: searchBar.text)
        self.searchBar?.endEditing(true)
    }

    @IBAction func didUpdateCategory(_ sender: Any) {
        presenter?.setCategory(category: segment!.selectedSegmentIndex)
    }
}

extension EventsView : EventCellDelegate{
    
    func didTapBuyTickets(url: String) {
        if let _url = URL(string: url){
            UIApplication.shared.open(_url)
        }
    }
    
    func didTapAddToFavorites(event: Event) {
        presenter?.addToFavorites(event: event)
    }
    
}
