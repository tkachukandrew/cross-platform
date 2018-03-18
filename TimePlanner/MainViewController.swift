//
//  MainViewController.swift
//  TimePlanner
//
//  Created by Andrew Tkachuk on 18.03.18.
//  Copyright © 2018 Andrew Tkachuk. All rights reserved.
//

import UIKit

protocol ChooseTimeDelegate {
    func timeChoosed();
}

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "chooseTimeSegue" {
            guard let destination = segue.destination as? ChooseTimeViewController else {
                return
            }
            destination.delegate = self
        }
    }
}

extension MainViewController: ChooseTimeDelegate {
    func timeChoosed() {
        navigationController?.popToViewController(self, animated: true)
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TimeManager.sharedInstance.timeObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let timeObject = TimeManager.sharedInstance.timeObjects[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: timeObject.2.rawValue) as? TimeCell else {
            return UITableViewCell()
        }
        cell.populateWith((timeObject.0, timeObject.1))
        return cell
    }
}
