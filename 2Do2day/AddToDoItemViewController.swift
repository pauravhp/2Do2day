//
//  AddToDoItemViewController.swift
//  2Do2day
//
//  Created by Paurav H Param on 2024-03-16.
//

import UIKit

class AddToDoItemViewController: UIViewController {

    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var toDoVC : ToDoListTableViewController? = nil
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDo(context: context)
            if let name = titleTextField.text {
                newToDo.title = name
            }
            newToDo.important = importantSwitch.isOn
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        
//        toDoVC?.todos.append(newToDo)
//        toDoVC?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }


}
