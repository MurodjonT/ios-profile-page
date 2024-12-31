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
    }
    
    func configureTableView() {
        ToDoListView.frame = view.bounds
        view.addSubview(ToDoListView)
        
    }
}
