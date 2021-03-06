//
//  CreateViewController.swift
//  TaskTracker
//
//  Created by Egor Dadugin on 06.03.2021.
//

import UIKit
import CoreData

class CreateViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateValue: UIDatePicker!
    @IBOutlet weak var noteTextField: UITextField!
    @IBAction func createTask(_ sender: UIButton) {
        TaskTracker.createTask(name: nameTextField.text!, date: dateValue.date, note: noteTextField.text!)
        let count = self.navigationController!.viewControllers.count
        let parrent = self.navigationController!.viewControllers[count-2] as! TableViewController
        parrent.tableView.reloadData()
        self.navigationController!.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
