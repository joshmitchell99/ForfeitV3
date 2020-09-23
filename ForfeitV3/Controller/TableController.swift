//
//  TableController.swift
//  ForfeitV3
//
//  Created by Josh Mitchell on 9/23/20.
//  Copyright © 2020 Ava Ford. All rights reserved.
//

import UIKit

class TableController: UITableViewController {
    var brain = ForfeitBrain()
        
        // Create a variable to hold the data URL of the filepath for the plist that contains the data to be saved
        let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
        
        override func viewDidLoad() {
            super.viewDidLoad()
            //print(dataFilePath!)
            print("reloading")
            brain.loadItems()
            tableView.reloadData()
        }
        
        // Returns the number of columns (sections) only ever 1 section so hard coded to 1
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        // Returns the number of items in the array of items pulled from the item array
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return brain.itemArray.count
        }

        // Function that runs when the user clicks on the item displayed in the table
        
        // Josh - Think this might run to draw data from us in order to display it.
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // Create reusable cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
            
            // Gets the title of the item that the user has pressed
            let item = brain.itemArray[indexPath.row]

            print("in table view: ", brain.itemArray.count, item.title)
            
            // adds the title value to the newly formed item
            cell.textLabel?.text = item.title
            
            // Defines the accessory of the checkmark to be able to be displayed
            // Ternary Operator ==>
            // Value = Condition ? valueIfTrue : valueIfFalse
            cell.accessoryType = item.done ? .checkmark : .none
            
            // If the user clicks on an item it will be marked with a tick to show it has been completed
            if item.done == true {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            // Return the cell value to the table to be displayed
            return cell
            
        }
        
        // This function runs when an item is clicked, highlighting it
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            print(indexPath.row)
            print(brain.itemArray[indexPath.row])
            
            brain.itemArray[indexPath.row].done = !brain.itemArray[indexPath.row].done
            tableView.reloadData()
            
            // Prevent the selected row from staying highlighted
            tableView.deselectRow(at: indexPath, animated: true)
            
            performSegue(withIdentifier: "SubmitEvidenceSegue", sender: self)
        }
        

    //MARK - Add New Items
        @IBAction func addButtonPressed(_ sender: UIButton) {
            performSegue(withIdentifier: "createItemSegue", sender: self)
    //        // Local variable to hold the value of the new item to be added
    //        var textField = UITextField()
    //
    //        // Pop-Up to show allowing the user to enter a new todo item
    //        // Then append this item into the brain.itemArray
    //        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
    //
    //        // Completion block that runs when the user has pressed the add item button
    //        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
    //            // What will happen once the user clicks the Add Item button on our UIAlert
    //            // Add the new item to the array
    //            // self.brain.itemArray.append(textField.text!)
    //            let newItem = Item()
    //            newItem.title = textField.text!
    //            self.brain.itemArray.append(newItem)
    //            // Save the updated item array to the user defaults
    //            // (value, key for that value)
    //            // self.defaults.set(self.brain.itemArray, forKey: "TodoListArray")
    //            self.saveItems()
    //
    //        }
    //
    //        alert.addTextField { (alertTextField) in
    //            alertTextField.placeholder = "Create new item"
    //
    //            // Extends the scope of the alertTextfield to the textField function variable
    //            textField = alertTextField
    //        }
    //
    //        alert.addAction(action)
    //        present(alert, animated: true, completion: nil)
        }
}
