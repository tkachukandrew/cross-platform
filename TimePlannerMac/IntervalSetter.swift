//
//  IntervalSetter.swift
//  TimePlannerMac
//
//  Created by Andrew Tkachuk on 22.03.18.
//  Copyright © 2018 Andrew Tkachuk. All rights reserved.
//

import Cocoa

class IntervalSetter: NSViewController {

    @IBOutlet weak var startTime: NSDatePicker!
    @IBOutlet weak var endTime: NSDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonPressed(_ sender: NSButton) {
        TimeManager.sharedInstance.addTimeInterval(start: startTime.dateValue, end: endTime.dateValue)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "updateTableNotification"), object: nil)
        self.view.window?.close()
    }
    
}
