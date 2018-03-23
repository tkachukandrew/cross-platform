//
//  TimePlannerTests.swift
//  TimePlannerTests
//
//  Created by Andrew Tkachuk on 18.03.18.
//  Copyright © 2018 Andrew Tkachuk. All rights reserved.
//

import XCTest
@testable import TimePlanner

class TimePlannerTests: XCTestCase {
    
    let dateFormatter = DateFormatter()
    var start: Date?
    var end: Date?
    
    override func setUp() {
        super.setUp()
        dateFormatter.dateFormat = "HH:mm"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNumberOfIntervals() {
        setUpTestWith(startTime: "16:00", endTime: "18:15")
        XCTAssertEqual(TimeManager.sharedInstance.getTimeObjects().count, 5)
    }
    
    func testAddSmallInterval() {
        setUpTestWith(startTime: "16:00", endTime: "16:14")
        XCTAssertEqual(TimeManager.sharedInstance.getTimeObjects().count, 1)
        XCTAssertEqual(TimeManager.sharedInstance.getTimeObjects()[0].2.rawValue, "busy")
        setUpTestWith(startTime: "16:00", endTime: "16:49")
        XCTAssertEqual(TimeManager.sharedInstance.getTimeObjects().count, 2)
    }
    
    func setUpTestWith(startTime: String, endTime: String) {
        start = dateFormatter.date(from: startTime)
        end = dateFormatter.date(from: endTime)
        TimeManager.sharedInstance.addTimeInterval(start: start ?? Date(), end: end ?? Date())
    }
    
}
