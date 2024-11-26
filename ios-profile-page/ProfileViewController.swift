//
//  ProfileViewController.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 26/11/24.
//
import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    private let profileTableView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        configureTableView()
        configureNavigationBar()
//        profileTableView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
    }
    
    private func configureTableView() {
        profileTableView.frame = view.bounds
        view.addSubview(profileTableView)
        
    }
    
    private func configureNavigationBar() {
        let CloseButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(closeTapped)
        )
        
        CloseButton.tintColor = .gray
        navigationItem.leftBarButtonItem = CloseButton
        
        // Set navigation bar title to "Profile" centered
              navigationItem.title = "Profile"
              let titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold)]
              navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        
    }

    
    
    @objc func closeTapped() {
        print("Notification tapped")
        
    }
}


