//
//  FavoritesProtocol.swift
//  ticket-master-app
//
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation

protocol FavoritesViewProtocol: class {
    
    var presenter: FavoritesPresenterProtocol? {get set}
    
}

protocol FavoritesPresenterProtocol: class {
    
    var view: FavoritesViewProtocol? {get set}
    
}

protocol FavoritesModelProtocol: class {
    
}
