//
//  TimeFormatter.swift
//  TimePlanner
//
//  Created by Andrew Tkachuk on 20.03.18.
//  Copyright © 2018 Andrew Tkachuk. All rights reserved.
//

import Foundation

fileprivate let hour = 3600.0
fileprivate let quarter = 900.0
let threeQuarters = 2700.0

class TimeFormatter {
    static var sharedInstance = TimeFormatter()
    
    private let formatter: DateFormatter
    
    private init() {
        formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
    }
    
    func timeFrom(_ date: Date) -> String {
        return formatter.string(from: date)
    }
    
    static func hoursBetween(start: Date, end: Date) -> Int {
        let timeInterval = end.timeIntervalSince(start)
        return Int(floor(timeInterval / hour))
    }
    
    static func dateByAdding15MinutesTo(_ date: Date) -> Date {
        return Date(timeInterval: TimeInterval(exactly: quarter) ?? 0, since: date)
    }
    
    static func dateByAdding45MinutesTo(_ date: Date) -> Date {
        return Date(timeInterval: TimeInterval(exactly: threeQuarters) ?? 0, since: date)
    }
}
