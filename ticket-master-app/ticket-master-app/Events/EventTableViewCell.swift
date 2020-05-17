//
//  EventTableViewCell.swift
//  ticket-master-app
//
//  Created by Pablo Casillas Marcos on 16/05/2020.
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit

protocol EventCellDelegate{
    func didTapBuyTickets(url:String)
    func didTapAddToFavorites(event:Event)
}

class EventTableViewCell: UITableViewCell {

    var delegate:EventCellDelegate?
    var url:String?
    var eventCell:Event?
    @IBOutlet var myImage: UIImageView!
    @IBOutlet var title: UILabel?
    @IBOutlet var date: UILabel?
    @IBOutlet var location:UILabel?
    @IBOutlet var city:UILabel?
    
    func setEvent(event:Event?){
        self.eventCell = event
        if let _title = event?.name{
            self.title?.text = _title
        }
        if let url = event?.images[0].url{
            self.myImage.load(urlString: url)
        }
        if let _date = event?.dates?.start.localDate{
            self.date?.text = _date
        }
        if let _location = event?.embedded.venues[0].name{
            self.location?.text = _location
        }
        if let _city = event?.embedded.venues[0].city?.name{
            self.city?.text = "Ciudad: "+_city
        }
        if let _url = event?.url{
            self.url = _url
        }
    }
    
    
    @IBAction func buyTicketsTapped(_ sender: UIButton) {
        if let eventUrl = url{
            delegate?.didTapBuyTickets(url: eventUrl)
        }
    }
    
    
    @IBAction func addToFavoritesTapped(_ sender: UIButton) {
        if let favorite = eventCell{
            delegate?.didTapAddToFavorites(event: favorite)
        }
    }
    
    
    
}
