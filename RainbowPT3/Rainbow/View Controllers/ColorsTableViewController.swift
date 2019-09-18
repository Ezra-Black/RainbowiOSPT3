//
//  ColorsTableViewController.swift
//  RainbowPT3
//
//  Created by Joseph Rogers on 9/17/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {
    
    var colors: [MyColor] = [MyColor(name: "Red", color: .red),
                             MyColor(name: "Orange", color: .orange),
                             MyColor(name: "Yellow", color: .yellow),
                             MyColor(name: "Green", color: .green),
                             MyColor(name: "Blue?", color: .blue),
                             MyColor(name: "Cyan", color: .cyan),
                             MyColor(name: "Purple", color: .purple)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colors.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        let color = colors[indexPath.row]
        cell.textLabel?.text = color.name
        return cell
    }
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowColorSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let colorDetailVC = segue.destination as? DetailViewController else {return}
            let cellColor = colors[indexPath.row]
            colorDetailVC.cellColor = cellColor
            
        }
    }
    
    
}
