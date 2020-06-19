//
//  ParkTest.swift
//  ListAppTests
//
//  Created by Isabella Lee on 4/29/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import XCTest
@testable import ListApp //needed for each test file

class ParkTest: XCTestCase {

    func testParkDebugDescription() {
        let subjectUnderTest = Park(named: "Yosemite",
                        country: "United States",
                        imageUrl: "https://www.nationalgeographic.com/content/dam/expeditions/destinations/north-america/private/Yosemite/Hero-Yosemite.ngsversion.1524840074980.adapt.1900.1.jpg",
                        rank: 1,
                        visitorsPerYear: "4M",
                        description: "fun park")
        
        let actualValue = subjectUnderTest.debugDescription
        
        let expectedValue = "Park(name: Yosemite, country: United States)"
        XCTAssertEqual(actualValue, expectedValue)
    }

}
