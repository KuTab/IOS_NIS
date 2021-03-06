//
//  TableViewController.swift
//  TaskTracker
//
//  Created by Egor Dadugin on 06.03.2021.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter",style: .plain, target: self, action: #selector(changeFilter))
        
        container.loadPersistentStores { storeDescription, error in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        
        loadSavedData()
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return Tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
     
        let task = Tasks[indexPath.row]
        cell.textLabel!.text = task.name
        
        if task.isDone{
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
     
        return cell
    }
    
    @objc func changeFilter() {
        let ac = UIAlertController(title: "Filter tasks...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Done", style: .default)
        { [unowned self] _ in
            taskPredicate = NSPredicate(format: "isDone == true")
            loadSavedData()
            tableView.reloadData()
        })
        
        ac.addAction(UIAlertAction(title: "Not done", style: .default)
        { [unowned self] _ in
            taskPredicate = NSPredicate(format: "isDone == false")
            loadSavedData()
            tableView.reloadData()
        })
            
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteTask(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentTask = Tasks[indexPath.row]
        if let detailVC = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            detailVC.currentTask = currentTask
            detailVC.index = indexPath.row
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
