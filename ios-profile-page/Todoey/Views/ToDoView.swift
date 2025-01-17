//
//  ToDoView.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 31/12/24.
//

import UIKit
import CoreData

class ToDoView: UITableView, UITableViewDataSource, UITableViewDelegate {
        
    var itemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.register(ToDoCell.self, forCellReuseIdentifier: ToDoCell.identifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        
        context.delete(itemArray[indexPath.row])
        itemArray.remove(at: indexPath.row)
        saveItem()
     
        
        (self.delegate as? ToDoListViewController)?.saveItem()

//        itemArray[indexPath.row].done.toggle()

//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }

        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func saveItem() {
        
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }
        self.reloadData()
        
    }
    
}
