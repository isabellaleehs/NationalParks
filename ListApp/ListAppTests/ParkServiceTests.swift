//
//  ParkServiceTests.swift
//  ListAppTests
//
//  Created by Isabella Lee on 4/29/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import XCTest
@testable import ListApp

class ParkServiceTests: XCTestCase {
    var systemUnderTest: ParkService!

    override func setUpWithError() throws {
        self.systemUnderTest = ParkService()
    }

    override func tearDownWithError() throws {
        self.systemUnderTest = nil
    }

    func testAPI_returnsSuccessfulResult() throws {
        var parks: [Park]!
        var error: Error?
        
        let promise = expectation(description: "Completion handler is invoked")
        
        self.systemUnderTest.getParks(completion: { data, shouldntHappen in
            parks = data
            error = shouldntHappen
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
        
        XCTAssertNotNil(parks)
        XCTAssertNil(error)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
