//
//  HomeView.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//  null -> viewDidLoad -> viewwillappear -> viewdidappear -> viewwilldisappear -> viewdiddissapear ->

import Foundation
import UIKit

class HomeView: UITabBarController, HomeViewProtocol {    
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {

        self.viewControllers = presenter?.getTabViewControllers()
        
    }
    
    
}
