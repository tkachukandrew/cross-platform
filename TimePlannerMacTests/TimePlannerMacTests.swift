//
//  TimePlannerMacTests.swift
//  TimePlannerMacTests
//
//  Created by Andrew Tkachuk on 18.03.18.
//  Copyright © 2018 Andrew Tkachuk. All rights reserved.
//

import XCTest
@testable import TimePlannerMac

class TimePlannerMacTests: XCTestCase {
    
    let formatter = DateFormatter()
    var startTime: Date?
    var endTime: Date?
    
    override func setUp() {
        super.setUp()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "uk_UA")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTimeStringFromDate() {
        let date = Date(timeIntervalSinceReferenceDate: 4200)
        XCTAssertEqual(TimeFormatter.sharedInstance.timeFrom(date, within: Locale(identifier: "uk_UA")), "03:10")
    }
    
    func testHoursCount() {
        setUpTest(start: "16:00", end: "19:33")
        XCTAssertEqual(TimeFormatter.hoursBetween(start: startTime ?? Date(), end: endTime ?? Date()), 3)
    }
    
    func testAdding45Minutes() {
        setUpTest(start: "16:00", end: "16:45")
        XCTAssertEqual(endTime, TimeFormatter.dateByAdding45MinutesTo(startTime ?? Date()))
    }
    
    func testAdding15Minutes() {
        setUpTest(start: "16:00", end: "16:15")
        XCTAssertEqual(endTime, TimeFormatter.dateByAdding15MinutesTo(startTime ?? Date()))
    }
    
    func setUpTest(start: String, end: String) {
        startTime = formatter.date(from: start)
        endTime = formatter.date(from: end)
    }
    
}
