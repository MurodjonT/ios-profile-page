//
//  HomeNavBarView.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 08/12/24.
//

import UIKit

class HomeNavBarView: UIViewController {

    private func setupNavigationBar() {
        let profileButton = UIBarButtonItem(
            image: UIImage(systemName: "person.circle"),
            style: .plain,
            target: self,
            action: #selector(profileButtonTapped)
        )

        let notificationButton = UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: self,
            action: #selector(notificationButtonTapped)
        )
        
        let searchButton = UIBarButtonItem(
            image: UIImage(systemName: "bell"),
            style: .plain,
            target: self,
            action: #selector(searchButtonTapped)
        )
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 30
        
        navigationItem.leftBarButtonItem = profileButton
        navigationItem.rightBarButtonItems = [notificationButton, spacer, searchButton]
    }
    
    private func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
    }

    @objc private func profileButtonTapped() {
        print("Profile icon tapped")
        // Bu yerda profile sahifaga o'tishni kodlashingiz mumkin
    }

    @objc private func notificationButtonTapped() {
        print("Notification icon tapped")
        // Bu yerda notification sahifaga o'tishni kodlashingiz mumkin
    }
    
    @objc private func searchButtonTapped() {
        print("Search icon tapped")
        // Bu yerda notification sahifaga o'tishni kodlashingiz mumkin
    }
}
