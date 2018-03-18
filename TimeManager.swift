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
    
    var timeObjects: [(Date, Date, TimeType)]
    
    private init() {
        timeObjects = []
    }
    
    func addTimeInterval(start: Date, end: Date) {
        timeObjects.removeAll()
        timeObjects.append((start, end, .work))
    }
}
