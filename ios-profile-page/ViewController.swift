//
//  ViewController.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 29/11/24.
//


import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let iconButton = BMIconButton(iconSize: CGSize(width: 50, height: 50), isCentre: true)
        iconButton.iconImageView.image = UIImage(systemName: "star.fill")
        iconButton.iconImageView.tintColor = .systemBlue
        
        view.addSubview(iconButton)
        
        iconButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(-100)
        }
        
        let icon2Button = BMIconButton(iconSize: CGSize(width: 50, height: 50), isCentre: true)
        icon2Button.iconImageView.image = UIImage(systemName: "star.fill")
        icon2Button.iconImageView.tintColor = .systemBlue
        
        view.addSubview(icon2Button)
        
        icon2Button.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.top.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(100)
        }
    }
}

