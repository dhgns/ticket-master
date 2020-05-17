//
//  FavoritesModel.swift
//  ticket-master-app
//
///  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import RealmSwift

class EventDAO: Object {
    
    @objc dynamic var url: String? = nil
    @objc dynamic var date: String? = nil
    @objc dynamic var city: String? = nil
    @objc dynamic var title: String? = nil
    @objc dynamic var location: String? = nil
    
    init(url: String?, date: String?, city: String?, title: String?, location: String?) {
        self.url = url
        self.date = date
        self.city = city
        self.location = location
        self.title = title
    }
    
    required init() {
        super.init()
    }
    
}

class EventDAOQueryResult {

    var data: Any?
    var result: Bool
    
    init(data: Any?, result: Bool){
        self.data = data
        self.result = result
    }
    
}
