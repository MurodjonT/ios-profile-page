//
//  ToDoListViewController.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 31/12/24.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    private let ToDoListView = ToDoView()
    //    let defaults = UserDefaults.standard
    let UserDefaultsKey = "ToDoListView"
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
        
        
//        
//        let newItem = Item()
//        newItem.title = "Item 1"
//        ToDoListView.itemArray.append(newItem)
//        
//        let newItem1 = Item()
//        newItem1.title = "Item 2"
//        ToDoListView.itemArray.append(newItem1)
//        
//        let newItem2 = Item()
//        newItem2.title = "Item 3"
//        ToDoListView.itemArray.append(newItem2)
        
        loadItems()
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
            
            let newItem = Item()
            newItem.title = textField.text!
            
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
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(ToDoListView.itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding  item array, \(error)")
        }
        self.ToDoListView.reloadData()
        
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                ToDoListView.itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
        }
    }
}
