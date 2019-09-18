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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            colors.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
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
    
    
    @IBAction func addColorButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Color", message: "Add a RGB Value for the new color", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Color name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Red 0-255"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Green 0-255"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Blue 0-255"
        }
        
        alert.addAction(UIAlertAction(title: "Create", style: .default, handler: { (_) in
            guard let name = alert.textFields?[0].text, !name.isEmpty else {return}
            guard let redString = alert.textFields?[1].text, let redValue = Double(redString) else {return}
            guard let greeenString = alert.textFields?[2].text, let greenValue = Double(greeenString) else {return}
            guard let blueString = alert.textFields?[3].text, let bluevalue = Double(blueString) else {return}
            
            let color = MyColor(name: name, color: UIColor(red: CGFloat(redValue / 255), green: CGFloat(greenValue / 255), blue: CGFloat(bluevalue / 255), alpha: 1.0))
            self.colors.append(color)
            self.tableView.reloadData()
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
