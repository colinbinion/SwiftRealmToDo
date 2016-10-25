//
//  ViewController.swift
//  ToDoListWithRealm
//
//  Created by Colin Binion on 10/24/16.
//  Copyright © 2016 Colin Binion. All rights reserved.
//

import UIKit
import Realm

class ViewController: UIViewController, UITableViewData {
    @IBAction func addTask(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New item", message: "Add a new item", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default)
        { (action); -&amp;amp;amp;amp;amp;gt;  Void; in
            let textField = alert.textFields![0] as UITextField
            let realm = RLMRealm.defaultRealm()
            if textField.text?.characters.count > 0 {
                let newTodoItem = ToDoItem()
                newTodoItem.task = textField.text!
                _ = try? realm.transactionWithBlock(){
                    realm.addObject(newTodoItem)
                }
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(saveAction)
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
        var todos = ToDoItem.allObjects()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // [1]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData() // [2]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(todos.count) // [3]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        
        let index = UInt(indexPath.row)
        let todoItem = todos.object(at: index) as! ToDoItem // [4]
        cell.textLabel!.text = todoItem.task // [5]
        
        return cell
}
