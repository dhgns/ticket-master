//
//  FavoritesView.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit

class FavoritesView: UIViewController, FavoritesViewProtocol,UITableViewDelegate,UITableViewDataSource {

        
    var presenter: FavoritesPresenterProtocol?
    
    @IBOutlet var table:UITableView?
    
    override func viewDidLoad() {
        
        presenter?.getData()
        table?.delegate = self
        table?.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func showEvents() {
        self.table?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getEvents().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favorite:EventDAO? = presenter?.getEvents()[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "favcell", for: indexPath) as! FavoritesTableviewCell
        cell.setEvent(event: favorite)
        cell.delegate = self
        return cell
    }
    
}

extension FavoritesView : FavoritesCellDelegate{
    func didTapBuyFavorite(url: String) {
        if let _url = URL(string: url){
            UIApplication.shared.open(_url)
        }
    }
    func didTapDeleteFavorite(event: Event) {
        
    }
}


