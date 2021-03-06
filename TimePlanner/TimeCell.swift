//
//  TimeCell.swift
//  TimePlanner
//
//  Created by Andrew Tkachuk on 18.03.18.
//  Copyright © 2018 Andrew Tkachuk. All rights reserved.
//

import UIKit

class TimeCell: UITableViewCell {

    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populateWith(_ tuple:(Date, Date)) {
        guard let timeZone = TimeZone(abbreviation: "UTC") else {
            return
        }
        startTime.text = TimeFormatter.sharedInstance.timeFrom(tuple.0, within: timeZone)
        endTime.text = TimeFormatter.sharedInstance.timeFrom(tuple.1, within: timeZone)
    }

}
