//
//  ViewController.swift
//  Yu_ToDoey
//
//  Created by David Cate on 1/11/18.
//  Copyright © 2018 Volume Labs. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    // Step One - Create initial startup display for content.
    var itemArray = [Item]()
    
    // STEP B - ESTABLISHING USER DEFAULTS FOR PERISTITENT STORAGE
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // NEW ITEM CONTROLLER
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)

        
        // Reactive our Defaults
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemArray = items
        }
        
    }
    
    //MARK - Tableview Datasource Methods
    
    // Step Two
    // Create datasource method
    // Number of rows
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // Step Three
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
        // Step Four
        // Create Reusable Cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        
        cell.textLabel?.text = item.title
        
        // Using Ternary Operator??
        // Not unique to Swift
        // Neat way of cutting down code.
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        // Changed code below to ternary operator above... ///////
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//
//        }
        
        return cell
        
    }
    
    
    //MARK - Creating Table View Delegate Methods
    // Gets fired whenever we click on any cell
    // Adds Print statement into console
    // Checks record in list
    
    // What is method called?
    // Tells that the specified row is selected
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Will print row and name.
        // print(itemArray[indexPath.row])
        
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done // Boolean has either one or two states.
        
        // This was old code. Instead - used above which says thing
        
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
        
        tableView.reloadData() // Forces tableview to call data source methods again.
        
        
        // Select TableView
        // Grabs reference to the cell at a particular index path
        // The one currently selected ... indexPath
        // Add accessory type of .checkmark
        // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        // How to remove checkmark once selected?
        // Need an if statement
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
     
        // Selects row and then animates / fades away.
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK - ADDING NEW ITEMS
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        // STEP ONE - Add Pop Up
        // UIVIew Controller
        // Have Text Field to Write Quick ToDo Item
        // Append to Item Array
        
        //
        
        // Local Variable
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the add item on our UIAlert
       
            //print(textField.text)
            
            // Add whatever text added - add this to item array.
            // Before we can append
            // We must change array from immutable to mutable by changing let to var
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            // STEP B2 - SAVE APPEND TO USER DEFAULTS
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData()
            
           }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
            
            
            // Need Local Variable - See Above
        }
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
        }
    
}

