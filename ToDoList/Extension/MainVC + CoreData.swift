//
//  MainVC + CoreData.swift
//  ToDoList
//
//  Created by Никита Бурин on 09.01.2023.
//

import UIKit
import CoreData

extension MainViewController {
    
     func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let context = getContext()
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            mainView.tasks = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
    @objc func saveTask () {
        
        let alertController = UIAlertController(title: "New task", message: "Please add a new task", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let tf = alertController.textFields?.first
            if let newTaskTitle = tf?.text {
              //  self.mainView.tasks.insert(newTask, at: 0)
                self.saveTaskTitle(withTitle: newTaskTitle)
                self.mainView.tableView.reloadData()
            }
        }
        
        alertController.addTextField()
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    private func saveTaskTitle(withTitle title: String) {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else {return}
        let taskObject = Task(entity: entity, insertInto: context)
        taskObject.title = title
        
        do {
            try context.save()
            mainView.tasks.insert(taskObject, at: 0)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
