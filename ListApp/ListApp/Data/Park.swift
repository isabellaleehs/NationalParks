//
//  Park.swift
//  ListApp
//
//  Created by Isabella Lee on 4/16/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import Foundation

class Park: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Park(name: \(self.name), country: \(self.country))"
    }
    
    var name: String
    var country: String
    var imageUrl: String
    var confirmedVisit: Bool = false
    
    init(named name: String, country: String, imageUrl: String) {
        self.name = name
        self.country = country
        self.imageUrl = imageUrl
    }
}
