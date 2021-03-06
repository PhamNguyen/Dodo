//
//  ViewController.swift
//  Dodo
//
//  Created by Nguyen Pham on 10/6/18.
//  Copyright © 2018 Nguyen Pham. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var items = ["Sport", "Games", "Drink"];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Table Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath);
        
        cell.textLabel?.text = items[indexPath.row];
        return cell;
    }

    // TableView Delegete methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath);
        
        //print(items[indexPath.row])
        let cell = tableView.cellForRow(at: indexPath)
        if(cell?.accessoryType != .checkmark){
            cell?.accessoryType = .checkmark;
        }
        else
        {
            cell?.accessoryType = .none;
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // barButton
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField();
        let alert = UIAlertController(title: "Add New Dodo", message: "", preferredStyle: .alert);
        let action = UIAlertAction(title: "Add", style: .default) { (UIAlertAction) in
          
            self.items.append(textField.text!);
            self.tableView.reloadData();
        }
        
        alert.addAction(action);
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create Dodo";
            textField = alertTextField;
        }
        
        present(alert, animated: true, completion: nil);
    }
    
}

