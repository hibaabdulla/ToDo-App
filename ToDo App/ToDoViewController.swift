//
//  ViewController.swift
//  ToDo App
//
//  Created by Hiba on 12/22/22.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    var itemArray = ["EAT", "SLEEP", "SHOPPING"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUi()
    }
    
    func setUi() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "todoCellIdentifier")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.preservesSuperviewLayoutMargins = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addButtonPressed))
        self.navigationItem.rightBarButtonItem = addButton
        addButton.tintColor = .white
    }
    
    @objc func addButtonPressed() {
        
        var textField = UITextField()
       
        let alert = UIAlertController(title: "Add New ToDo Items", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create new item"
            
            textField = alertTextfield
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
   let cell = tableView.dequeueReusableCell(withIdentifier: "todoCellIdentifier", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
   
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
