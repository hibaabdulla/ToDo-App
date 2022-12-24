//
//  ViewController.swift
//  ToDo App
//
//  Created by Hiba on 12/22/22.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    let itemArray = ["EAT", "SLEEP", "SHOPPING"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUi()
    }
    
    func setUi() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "todoCellIdentifier")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
   let cell = tableView.dequeueReusableCell(withIdentifier: "todoCellIdentifier", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

}
