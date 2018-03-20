//
//  TimeManager.swift
//  TimePlanner
//
//  Created by Andrew Tkachuk on 18.03.18.
//  Copyright © 2018 Andrew Tkachuk. All rights reserved.
//

import Foundation

enum TimeType: String {
    case work = "busy"
    case rest = "free"
}

class TimeManager {
    static var sharedInstance = TimeManager()
    
    private var timeObjects: [(Date, Date, TimeType)]
    
    private init() {
        timeObjects = []
    }
    
    func addTimeInterval(start: Date, end: Date) {
        timeObjects.removeAll()
        let hours = TimeFormatter.hoursBetween(start: start, end: end)
        var startTime = start
        if hours > 0 {
            for _ in 0..<hours {
                let middleTime = TimeFormatter.dateByAdding45MinutesTo(startTime)
                timeObjects.append((startTime, middleTime, .work))
                let endTime = TimeFormatter.dateByAdding15MinutesTo(middleTime)
                timeObjects.append((middleTime, endTime, .rest))
                startTime = endTime
            }
            addSmallTimeInterval(start: startTime, end: end)
        } else {
           addSmallTimeInterval(start: startTime, end: end)
        }
    }
    
    private func addSmallTimeInterval(start: Date, end: Date) {
        var startTime = start
        if end.timeIntervalSince(startTime) > threeQuarters {
            timeObjects.append((startTime, TimeFormatter.dateByAdding45MinutesTo(startTime), .work))
            startTime = TimeFormatter.dateByAdding45MinutesTo(startTime)
            timeObjects.append((startTime, end, .rest))
        } else {
            timeObjects.append((startTime, end, .work))
        }
    }
    
    func getTimeObjects() -> [(Date, Date, TimeType)] {
        return timeObjects
    }
}
