//
//  HomeController.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 07/12/24.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        setupNavigationBar()
        setupNavigationBarAppearance()
        view.backgroundColor = .white // Tugmalarni test qilish uchun fon rangi

    }

    private func setupNavigationBar() {
        let profileButton = UIBarButtonItem(
            image: UIImage(systemName: "person.circle"),
            style: .plain,
            target: self,
            action: #selector(profileButtonTapped)
        )
        
        let notificationButton = UIButton(type: .system)
        notificationButton.setImage(UIImage(systemName: "bell"), for: .normal)
        notificationButton.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        // UIStackView yaratish va tugmalarni joylashtirish
        let stackView = UIStackView(arrangedSubviews: [searchButton, notificationButton])
        stackView.axis = .horizontal
        stackView.spacing = 5 // Tugmalar orasidagi bo‘shliq
        stackView.alignment = .center
        
        let stackBarButton = UIBarButtonItem(customView: stackView)
        
        // Tugmalarni navigation bar-ga joylashtirish
        navigationItem.leftBarButtonItem = profileButton
        navigationItem.rightBarButtonItem = stackBarButton
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
