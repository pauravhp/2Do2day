//
//  ViewToDoItemViewController.swift
//  2Do2day
//
//  Created by Paurav H Param on 2024-03-16.
//

import UIKit

class ViewToDoItemViewController: UIViewController {

    var todo : ToDo? = nil
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var toDoVC : ToDoListTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var titleStr = ""
        if let toDo = todo {
            if toDo.important {
                titleStr = "❗️"
            }
            if let title = toDo.title {
                titleLabel.text = titleStr + title
            } 
        }
    }
    
    @IBAction func completeTapped(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDo = todo {
                context.delete(toDo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        
        navigationController?.popViewController(animated: true)
    }

}
