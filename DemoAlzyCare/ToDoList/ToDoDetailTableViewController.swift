//
//  ToDoDetailTableViewController.swift
//  List_
//
//  Created by Batch-2 on 08/05/24.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {
    
    
    @IBOutlet var titleTextField: UITextField!
    
    @IBOutlet var isCompleteButton: UIButton!
    
    
   
    @IBOutlet var dueDateLabel: UILabel!
    
    
    @IBOutlet var dueDateDatePicker: UIDatePicker!
    
    
    @IBOutlet var notesTextView: UITextView!
    
    @IBOutlet var saveButton : UIBarButtonItem!
    
    
    
    var isDatePickerHidden = true
    let dataLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    var toDo : ToDo?
    
    var todos = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDueDate : Date
        if let toDo = toDo {
            navigationItem.title = "To-Do"
            titleTextField.text = toDo.title
            isCompleteButton.isSelected = toDo.iscomplte
            currentDueDate = toDo.dueDate
            notesTextView.text = toDo.notes
            
        }else{
            currentDueDate = Date().addingTimeInterval(24*60*60)
        }
        
        dueDateDatePicker.date = currentDueDate
        updateDueDateLabel(date: currentDueDate)
        updateSaveButtonState()
        
        
        

    
    }

    // MARK: - Table view data source

  
    
    func updateSaveButtonState(){
        let shouldEnableSaveButton = titleTextField.text?.isEmpty == false
        saveButton.isEnabled = shouldEnableSaveButton
        
    }

    
    @IBAction func textEditingChanged(_ sender: UITextField) {
       updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
    }
    
    func updateDueDateLabel(date: Date){
        dueDateLabel.text = date.formatted(.dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute())
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: sender.date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case datePickerIndexPath where isDatePickerHidden == true:
            return 0
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case datePickerIndexPath:
            return 216
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == dataLabelIndexPath{
            isDatePickerHidden.toggle()
            updateDueDateLabel(date: dueDateDatePicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else {return}
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDateDatePicker.date
        let notes = notesTextView.text
        
        if toDo != nil {
            toDo?.title = title
            toDo?.iscomplte = isComplete
            toDo?.dueDate = dueDate
            toDo?.notes = notes
        }else{
            toDo = ToDo(title: title, iscomplte: isComplete, dueDate: dueDate, notes: notes)
        }
    }

    
   
    
    

    
    @IBSegueAction func editToDo(_ coder: NSCoder, sender: Any?) -> ToDoDetailTableViewController? {
        let detailController = ToDoDetailTableViewController(coder: coder)
        
        guard let cell = sender as? UITableViewCell,let indexPath = tableView.indexPath(for: cell) else {
            return detailController
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        detailController?.toDo = todos[indexPath.row]
        return detailController
    }
    
}
