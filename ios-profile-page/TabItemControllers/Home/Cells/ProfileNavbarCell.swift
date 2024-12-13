//
//  Untitled.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 12/12/24.
//
import UIKit
import SnapKit

class ProfileNavbarCell: UIViewController {
    
    
    func configureNavigationBar() {
        // Chap taraf: foydalanuvchi rasmi
        let profileImage = UIImage(systemName: "person.crop.circle")
        let profileButton = UIBarButtonItem(image: profileImage,
                                            style: .plain,
                                            target: self,
                                            action: #selector(profileTapped))
        navigationItem.leftBarButtonItem = profileButton
        
        // O'ng taraf: xabar tugmasi
        let notificationImage = UIImage(systemName: "bell")
        let notificationButton = UIBarButtonItem(image: notificationImage,
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(notificationTapped))
        
        
        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchButton = UIBarButtonItem(image: searchImage,
                                           style: .plain,
                                           target: self,
                                           action: #selector(searchTapped))
        
        navigationItem.rightBarButtonItems = [notificationButton, searchButton]
    }
    
    @objc private func profileTapped() {
        print("Profile button tapped")
    }
    
    @objc private func notificationTapped() {
        print("Notification button tapped")
    }
    
    @objc private func searchTapped() {
        print("Notification button tapped")
    }
}
