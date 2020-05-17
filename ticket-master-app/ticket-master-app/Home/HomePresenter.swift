//
//  HomeViewModel.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit

class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomeView?
        
    func getTabViewControllers() -> Array<UIViewController> {
        
        let viewOne = buildEventsView()
                
        let viewTwo = buildFavoritesView()
        
        return [viewOne, viewTwo]
        
    }
    
    
    func buildEventsView() -> UIViewController {
        
        let view: EventsView = UIStoryboard.init(name: "EventsStoryboard", bundle: .main).instantiateViewController(withIdentifier: "EventsView") as! EventsView
        view.title = "Eventos"
        view.tabBarItem.image = #imageLiteral(resourceName: "crown-7")
        let presenter = EventsPresenter()
        presenter.view = view
        
        (view as EventsViewProtocol).presenter = presenter
        
        
        return view
    }
    
    func buildFavoritesView() -> UIViewController {
        
        let view: FavoritesView = UIStoryboard.init(name: "FavoritesStoryboard", bundle: .main).instantiateViewController(withIdentifier: "FavoritesView") as! FavoritesView
        view.title = "Favoritos"
        view.tabBarItem.image = #imageLiteral(resourceName: "heart-7")
        let presenter = FavoritesPresenter()
        presenter.view = view
        
        (view as FavoritesViewProtocol).presenter = presenter
        
        return view
        
    }
    
}
