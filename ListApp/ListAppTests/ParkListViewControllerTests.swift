//
//  ParkListViewControllerTests.swift
//  ListAppTests
//
//  Created by Isabella Lee on 4/29/20.
//  Copyright © 2020 Isabella Lee. All rights reserved.
//

import XCTest
@testable import ListApp

class ParkListViewControllerTests: XCTestCase {
    var systemUnderTest: ParkListViewController!

    override func setUpWithError() throws {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        self.systemUnderTest = navigationController.topViewController as? ParkListViewController
        
        UIApplication.shared.windows
            .filter { $0.isKeyWindow }
            .first!
            .rootViewController = self.systemUnderTest
        
        XCTAssertNotNil(navigationController.view)
        XCTAssertNotNil(self.systemUnderTest.view)
    }

    func testTableView_loadsParks() {
        let mockParkService = MockParkService()
        let mockParks = [
            Park(named: "Yosemite", country: "United States", imageUrl: "https://media2.trover.com/T/5936d24ee39890402702ea58/fixedw_large_2x.jpg", rank: 1, visitorsPerYear: "4M", description: "fun yosemite"),
            Park(named: "Grand Canyon", country: "United States", imageUrl: "https://media2.trover.com/T/5936d24ee39890402702ea58/fixedw_large_2x.jpg", rank: 1, visitorsPerYear: "4M", description: "fun gc"),
            Park(named: "Death Valley", country: "United States", imageUrl: "https://media2.trover.com/T/5936d24ee39890402702ea58/fixedw_large_2x.jpg", rank: 1, visitorsPerYear: "4M", description: "fun dv")
        ]
        mockParkService.mockParks = mockParks
        
        self.systemUnderTest.viewDidLoad()
        self.systemUnderTest.parkService = mockParkService
        
        XCTAssertEqual(0, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
        
        //When
        self.systemUnderTest.viewWillAppear(false)
        
        //Then
        XCTAssertEqual(mockParks.count, self.systemUnderTest.parks.count)
        XCTAssertEqual(mockParks.count, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
    }
    
    class MockParkService: ParkService {
        var mockParks: [Park]?
        var mockError: Error?
        
        override func getParks(completion: @escaping ([Park]?, Error?) -> ()) {
            completion(mockParks, mockError)
        }
    }
}
