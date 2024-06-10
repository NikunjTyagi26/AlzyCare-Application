//
//  ToDoTableViewController.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 10/06/24.
//

import Foundation
import UIKit

class ToDoTableViewController: UITableViewController, ToDoCellDelegate {
    
    
    @IBOutlet var editButton: UIBarButtonItem!
    
    
    func checkmarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender){
            var toDo = todos[indexPath.row]
            toDo.iscomplte.toggle()
            todos[indexPath.row] = toDo
            tableView.reloadRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos)
        }
           
    }
    
    
    var todos = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let savedToDos = ToDo.loadToDos(){
            todos = savedToDos
        }else{
            todos = ToDo.loadSampleToDos()
        }
        
//        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath) as! ToDoCell

        
        // Configure the cell...
        let toDo = todos[indexPath.row]
        cell.titleLabel?.text = toDo.title
        cell.isCompleteButton.isSelected = toDo.iscomplte
        cell.delegate = self

        return cell
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            ToDo.saveToDos(todos)
        }
    }
    

 
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    @IBAction func unwindToDoList(segue: UIStoryboardSegue){
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! ToDoDetailTableViewController
        
        if let toDo = sourceViewController.toDo{
            if let indexOfExistingToDo = todos.firstIndex(of: toDo){
                todos[indexOfExistingToDo] = toDo
                tableView.reloadRows(at: [IndexPath(row: indexOfExistingToDo, section: 0)], with: .automatic)
            }else{
                let newIndexPath = IndexPath(row: todos.count, section: 0)
                todos.append(toDo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            
        }
        ToDo.saveToDos(todos)
    }
    
    

    
    
    
}
