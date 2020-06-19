//
//  Park.swift
//  ListApp
//
//  Created by Isabella Lee on 4/16/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import Foundation

class Park: CustomDebugStringConvertible, Codable {
    var debugDescription: String {
        return "Park(name: \(self.name), country: \(self.country))"
    }
    
    var name: String
    var country: String
    var imageUrl: String
    var rank: Int
    var visitorsPerYear: String
    var description: String
    var confirmedVisit: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case name, country, imageUrl, rank, visitorsPerYear, description
    }
    
    init(named name: String, country: String, imageUrl: String, rank: Int, visitorsPerYear: String, description: String) {
        self.name = name
        self.country = country
        self.imageUrl = imageUrl
        self.rank = rank
        self.visitorsPerYear = visitorsPerYear
        self.description = description
    }
}

struct ParkResult: Codable {
    let parks: [Park]
}
