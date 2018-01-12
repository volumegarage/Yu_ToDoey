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
    let itemArray = ["Find Mike", "Buy Eggos", "Destroy Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
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
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
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
        
        // Select TableView
        // Grabs reference to the cell at a particular index path
        // The one currently selected ... indexPath
        // Add accessory type of .checkmark
        // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        // How to remove checkmark once selected?
        // Need an if statement
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
     
        // Selects row and then animates / fades away.
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

