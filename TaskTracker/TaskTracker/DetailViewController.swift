//
//  DetailViewController.swift
//  TaskTracker
//
//  Created by Egor Dadugin on 06.03.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var doneSwitcher: UISwitch!
    @IBAction func changeState(_ sender: UISwitch) {
        Tasks[index].isDone = !Tasks[index].isDone
        saveContext()
        let count = self.navigationController!.viewControllers.count
        let parrent = self.navigationController!.viewControllers[count-2] as! TableViewController
        parrent.tableView.reloadData()
    }
    
    var currentTask: Task = Task()
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Name: " + currentTask.name
        dateLabel.text = "Date: " + formatDate(date: currentTask.date)
        noteLabel.text = "Note: " + currentTask.note
        if(currentTask.isDone){
            doneSwitcher.isOn = true
        } else{
            doneSwitcher.isOn = false
        }
    }
}
