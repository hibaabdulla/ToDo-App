//
//  ViewController.swift
//  ToDo App
//
//  Created by Hiba on 12/22/22.
//


import UIKit

class ToDoViewController: UITableViewController {

    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("items.plist")

            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUi()
        
        
        print(dataFilePath!)
        
        let newItem1 = Item()
        newItem1.title = "EAT"
        itemArray.append(newItem1)
        
        let newItem3 = Item()
        newItem3.title = "EAT3"
        itemArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "EAT4"
        itemArray.append(newItem4)
        
        loadItems()
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
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            self.saveItems()

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
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
       
        cell.accessoryType = item.done ? .checkmark : .none
        
       
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
     
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()
      
   
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func saveItems() {
        
        let encoder = PropertyListEncoder()
                    
                    do {
                        let data = try encoder.encode(itemArray)
                        try data.write(to: dataFilePath!)
                        
                    } catch {
                        print("error encoding item array, \(error)")
                    }
                    tableView.reloadData()
    }
func loadItems(){
    if let data = try? Data(contentsOf: dataFilePath!){
        let decoder = PropertyListDecoder()
        do {
            itemArray = try decoder.decode([Item].self, from: data) }
    
        catch {
            print("Error decoding item array,\(error)")
        }
}

}
}
    
