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
                Park(named: "Yellowstone National Park", country: "United States", imageUrl: "https://www.uponarriving.com/wp-content/uploads/2019/07/Yellowstone-National-Park-640x410.jpg"),
                Park(named: "Yosemite National Park", country: "United States", imageUrl: "https://www.tripsavvy.com/thmb/thX3YIj4_UVrTv8K02y9eETO_yc=/3424x2568/smart/filters:no_upscale()/el-capitan-in-yosemite-valley-yosemite-national-park-california-usa-683750057-58ee408d5f9b582c4daf279a.jpg"),
                Park(named: "Glacier National Park", country: "United States", imageUrl: "https://www.wpi.edu/sites/default/files/Montana-Glacier-National-Park-Mountains-Cracker-Lake-1733309.jpg"),
                Park(named: "Grand Canyon National Park", country: "United States", imageUrl: "https://www.tripsavvy.com/thmb/KyPHyyx2O9y2ZOSeNNl5qdPRqJ4=/2119x1415/filters:fill(auto,1)/GrandCanyonNationalPark-d97b78edfff14d52bca71f5962ac2af5.jpg"),
                Park(named: "Serengeti National Park", country: "Tanzania", imageUrl: "https://www.serengetiparktanzania.com/wp-content/uploads/2019/04/10-top-things-to-do-in-serengeti-750x314.jpg"),
                Park(named: "Zion National Park", country: "United States", imageUrl: "https://www.outsideonline.com/sites/default/files/styles/full-page/public/2019/12/11/zion-national-park_h.jpg?itok=ijAR7GYT"),
                Park(named: "Jasper National Park", country: "Canada", imageUrl: "https://lp-cms-production.imgix.net/2019-06/79941051.jpg?fit=crop&q=40&sharp=10&vib=20&auto=format&ixlib=react-8.6.4"),
                Park(named: "Hawai'i Volcanoes National Park", country: "United States", imageUrl: "https://www.gannett-cdn.com/-mm-/af75a4a62d29af0189a147a6a66d8d1b18073da9/c=0-104-2048-1261/local/-/media/2016/10/05/USATODAY/USATODAY/636112853233965211-test.jpg?width=660&height=373&fit=crop&format=pjpg&auto=webp"),
                Park(named: "Torres del Paine National Park", country: "Chile", imageUrl: "https://www.nationalgeographic.com/content/dam/travel/2017-digital/torres-del-paine-patagonia/torres-del-paine-national-park-patagonia.jpg"),
                Park(named: "Kruger National Park", country: "South Africa", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/Kruger_Zebra.JPG/1200px-Kruger_Zebra.JPG"),
                Park(named: "Grand Teton National Park", country: "United States", imageUrl: "https://www.nationalgeographic.com/content/dam/expeditions/destinations/north-america/land/Yellowstone-and-Grand-Teton-National-Park/yellowstone-grand-teton-np.ngsversion.1545338598661.adapt.1900.1.jpg"),
                Park(named: "Guilin and Lijiang River National Park", country: "China", imageUrl: "https://4389am1s8ztx36qo1i37bs17-wpengine.netdna-ssl.com/wp-content/uploads/NPT-National-Park-Guilin-Lijiang-River_national-park-slider-china-guilin-lijiang-river01.jpg"),
                Park(named: "Rocky Mountain National Park", country: "United States", imageUrl: "https://www.outtherecolorado.com/wp-content/uploads/2019/06/iStock-996409334-1024x683.jpg"),
                Park(named: "Uluru-Kata Tjuta National Park", country: "Australia", imageUrl: "https://d3hne3c382ip58.cloudfront.net/files/uploads/bookmundi/resized/cmsfeatured/uluru-rock-1511763600-785X440.jpg"),
                Park(named: "Fiordland National Park", country: "New Zealand", imageUrl: "https://www.newzealand.com/assets/Tourism-NZ/Fiordland/56113b64e7/img-1536379062-737-23013-0C766224-0B3D-BC30-B430C77F83D04968__aWxvdmVrZWxseQo_FocalPointCropWzQyNyw2NDAsNDcsNDAsODUsImpwZyIsNjUsMi41XQ.jpg"),
                Park(named: "Arches National Park", country: "United States", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/f/f0/Delicate_arch_sunset.jpg"),
                Park(named: "Sequoia National Park", country: "United States", imageUrl: "https://www.pewtrusts.org/-/media/post-launch-images/2017/12/sequoia_2/sequoia_2_16x9.jpg"),
                Park(named: "Bryce Canyon National Park", country: "United States", imageUrl: "https://www.nationalgeographic.com/content/dam/travel/2019-digital/bryce-canyon-national-park-utah/01-bryce-canyon-national-park-utah.jpg"),
                Park(named: "Swiss National Park", country: "Switzerland", imageUrl: "https://www.myswitzerland.com/-/media/dam/resources/places/s/w/swiss%20national%20park/images%20summer/23858_32001800.jpeg"),
                Park(named: "Olympic National Park", country: "United States", imageUrl: "https://media.tacdn.com/media/attractions-splice-spp-674x446/07/18/f3/07.jpg")
                ]
    }
}
