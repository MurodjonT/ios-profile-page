//
//  ToDoListViewController.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 31/12/24.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    private let ToDoListView = ToDoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
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
        let alert = UIAlertController(title: "Add New ToDo", message: "", preferredStyle: .alert)
                
        let alertAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("Success")
        }
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
                                        
        }
}
