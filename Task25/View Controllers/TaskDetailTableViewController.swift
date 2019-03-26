//
//  TaskDetailTableViewController.swift
//  Task25
//
//  Created by Hannah Hoff on 3/13/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task? {
        didSet{
            updateViews()
        }
    }
    
    var dueDateValue: Date?

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDateTextField.inputView = dueDatePicker
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        updateTask()
        let _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.dueDateTextField.text = sender.date.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        self.taskNameTextField.resignFirstResponder()
        self.dueDateTextField.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
    }
    
    
        private func updateTask() {
        guard let name = taskNameTextField.text else { return }
        let due = dueDateValue
        let notes = notesTextView.text
        
        if let task = self.task {
            TaskController.shared.update(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.shared.create(addTaskName: name, notes: notes, due: due)
        }
    }
    
    private func updateViews() {
        guard let task = task, isViewLoaded else { return }
        
        title = task.name
        taskNameTextField.text = task.name
        dueDateTextField.text = (task.due as Date?)?.stringValue()
        notesTextView.text = task.notes
    }
}
