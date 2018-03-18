//
//  ChooseTimeViewController.swift
//  TimePlanner
//
//  Created by Andrew Tkachuk on 18.03.18.
//  Copyright © 2018 Andrew Tkachuk. All rights reserved.
//

import UIKit

class ChooseTimeViewController: UIViewController {
    
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var endTimePicker: UIDatePicker!
    var delegate: ChooseTimeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        TimeManager.sharedInstance.addTimeInterval(start: startTimePicker.date, end: endTimePicker.date)
        delegate?.timeChoosed()
    }

}
