//
//  TaskController.swift
//  Task25
//
//  Created by Hannah Hoff on 3/13/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    // shared instance
    static let shared = TaskController()
    
    var tasks: [Task] = []
    
    init() {
        tasks = fetchTasks()
    }
    
    // landing pad
    var task: [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        return(try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    // Crud
    func create(addTaskName name: String, notes: String?, due: Date?){
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersitentStore()
        tasks = fetchTasks()
        
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersitentStore()
        tasks = fetchTasks()
        
    }
    
    func delete(task: Task) {
        task.managedObjectContext?.delete(task)
        saveToPersitentStore()
        tasks = fetchTasks()
        
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
    }
    
    // Persistence
    
    private func saveToPersitentStore() {
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error saving to persistent store \(error) \(error.localizedDescription)")
        }
    }
    
    private func fetchTasks() -> [Task] {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
}
