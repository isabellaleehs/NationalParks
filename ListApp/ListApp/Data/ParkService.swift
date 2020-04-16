//
//  ParkService.swift
//  ListApp
//
//  Created by Isabella Lee on 4/16/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import Foundation

class ParkService {
    func getParks() -> [Park] {
        return [
                Park(named: "Yellowstone National Park", country: "United States"),
                Park(named: "Yosemite National Park", country: "United States"),
                Park(named: "Glacier National Park", country: "United States"),
                Park(named: "Grand Canyon National Park", country: "United States"),
                Park(named: "Serengeti National Park", country: "Tanzania"),
                Park(named: "Zion National Park", country: "United States"),
                Park(named: "Jasper National Park", country: "Canada"),
                Park(named: "Hawai'i Volcanoes National Park", country: "United States"),
                Park(named: "Torres del Paine National Park", country: "Chile"),
                Park(named: "Kruger National Park", country: "South Africa"),
                Park(named: "Grand Teton National Park", country: "United States"),
                Park(named: "Guilin and Lijiang River National Park", country: "China"),
                Park(named: "Rocky Mountain National Park", country: "United States"),
                Park(named: "Uluru-Kata Tjuta National Park", country: "Australia"),
                Park(named: "Fiordland National Park", country: "New Zealand"),
                Park(named: "Arches National Park", country: "United States"),
                Park(named: "Sequoia National Park", country: "United States"),
                Park(named: "Bryce Canyon National Park", country: "United States"),
                Park(named: "Swiss National Park", country: "Switzerland"),
                Park(named: "Olympic National Park", country: "United States")
                ]
    }
}
