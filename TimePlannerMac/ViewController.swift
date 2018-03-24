//
//  ViewController.swift
//  TimePlannerMac
//
//  Created by Andrew Tkachuk on 18.03.18.
//  Copyright © 2018 Andrew Tkachuk. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    private let timeCell = "timeCell"
    private let typeCell = "typeCell"

    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "updateTableNotification"), object: nil, queue: nil) { [weak self] (notification) in
            self?.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return TimeManager.sharedInstance.getTimeObjects().count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let identifier: String
        let text: String
        if tableColumn == tableView.tableColumns[0] {
            identifier = timeCell
            guard let timeZone = TimeZone(abbreviation: "UTC") else {
                return NSTableCellView()
            }
            text = "\(TimeFormatter.sharedInstance.timeFrom(TimeManager.sharedInstance.getTimeObjects()[row].0, within: timeZone)) - \(TimeFormatter.sharedInstance.timeFrom(TimeManager.sharedInstance.getTimeObjects()[row].1, within: timeZone))"
        } else {
            identifier = typeCell
            text = TimeManager.sharedInstance.getTimeObjects()[row].2.rawValue
        }
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: identifier), owner: nil) as? NSTableCellView else {
            return nil
        }
        cell.textField?.stringValue = text
        return cell
    }
}
