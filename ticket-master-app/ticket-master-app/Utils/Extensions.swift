//
//  Extensions.swift
//  ticket-master-app
//
//  Created by Pablo Casillas on 17/05/2020.
//  Copyright © 2020 Pablo Casillas Marcos. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    func load(urlString:String){
        guard let url = URL(string: urlString) else {
            return
            
        }
        DispatchQueue.global().async {[weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
        
    }
}
