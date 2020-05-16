//
//  HomeProtocols.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    
    var presenter: HomePresenterProtocol? {get set}
    
}

protocol HomePresenterProtocol: class {
    
    var view: HomeView? {get set}
    
    func getTabViewControllers()-> Array<UIViewController>
    
}


protocol HomeModelProtocol: class {}
