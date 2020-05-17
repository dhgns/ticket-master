//
//  EventTableViewCell.swift
//  ticket-master-app
//
//  Created by Pablo Casillas Marcos on 16/05/2020.
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit

protocol FavoritesCellDelegate{
    func didTapBuyFavorite(url:String)
    func didTapDeleteFavorite(event:EventDAO)
}

class FavoritesTableviewCell: UITableViewCell {

    var delegate:FavoritesCellDelegate?
    var url:String?
    var eventCell:EventDAO?
    
    @IBOutlet var favImage: UIImageView!
    @IBOutlet var favTitle: UILabel?
    @IBOutlet var favDate: UILabel?
    @IBOutlet var favLocation:UILabel?
    @IBOutlet var favCity:UILabel?
    
    func setEvent(event:EventDAO?){
        self.eventCell = event
        if let _title = event?.title{
            self.favTitle?.text = _title
        }
        if let _image = event?.image{
            self.favImage.load(urlString: _image)
        }
        if let _date = event?.date{
            self.favDate?.text = _date
        }
        if let _location = event?.location{
            self.favLocation?.text = _location
        }
        if let _city = event?.city{
            self.favCity?.text = "Ciudad: "+_city
        }
        if let _url = event?.url{
            self.url = _url
        }
    }
    
    
    @IBAction func buyFavoriteTapped(_ sender: UIButton) {
        if let eventUrl = url{
            delegate?.didTapBuyFavorite(url: eventUrl)
        }
    }
    
    @IBAction func deleteFavoriteTapped(_ sender: UIButton) {
        if let favorite = eventCell{
            delegate?.didTapDeleteFavorite(event: favorite)
        }
    }
    
    
    
}
