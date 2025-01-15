//
//  ToDoListViewController.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 31/12/24.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    private let ToDoListView = ToDoView()
    let UserDefaultsKey = "ToDoListView"
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
        
//        loadItems()
    }
    
    func configureTableView() {
        ToDoListView.frame = view.bounds
        view.addSubview(ToDoListView)
        
    }
    
    func configureNavigationBar() {
        let AddButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app.fill"),
            style: .plain,
            target: self,
            action: #selector(AddTapped)
        )
        
        AddButton.tintColor = .systemBlue
        navigationItem.rightBarButtonItem = AddButton
        // Set navigation bar title to "Profile" centered
        navigationItem.title = "Profile"
        let titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold)]
        navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        
    }
    
    @objc func AddTapped() {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New ToDo", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            
            self.ToDoListView.itemArray.append(newItem)
            
            self.saveItem()
            self.ToDoListView.reloadData()
            
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func saveItem() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }
        self.ToDoListView.reloadData()
        
    }
    
//    func loadItems() {
//        if let data = try? Data(contentsOf: dataFilePath!) {
//            let decoder = PropertyListDecoder()
//            do {
//                ToDoListView.itemArray = try decoder.decode([Item].self, from: data)
//            } catch {
//                print("Error decoding item array, \(error)")
//            }
//        }
//    }
}
