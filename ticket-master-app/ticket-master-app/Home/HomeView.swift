//
//  HomeView.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UITabBarController {
    
    override func viewDidLoad() {
        
        print("ey")
        
        var viewOne = UIStoryboard.init(name: "EventsStoryboard", bundle: .main).instantiateViewController(withIdentifier: "EventsView") as! UIViewController
                
        var viewTwo = UIStoryboard.init(name: "FavoritesStoryboard", bundle: .main).instantiateViewController(withIdentifier: "FavoritesView") as! UIViewController
        
        self.viewControllers = [viewOne, viewTwo]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ey")

    }
    
    
}
