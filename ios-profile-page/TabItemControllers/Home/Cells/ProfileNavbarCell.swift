//
//  Untitled.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 12/12/24.
//
import UIKit
import SnapKit

class ProfileNavbarCell: UIView {
    
    let profileImageView = UIImageView()
    let searchButton = UIImageView()
    let notificationButton = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Profile icon
        profileImageView.image = UIImage(systemName: "person.circle")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
        self.addSubview(profileImageView)
        
        searchButton.image = UIImage(systemName: "person.circle")
        searchButton.contentMode = .scaleAspectFill
        searchButton.layer.cornerRadius = 20
        searchButton.clipsToBounds = true
        self.addSubview(searchButton)
        
        notificationButton.image = UIImage(systemName: "person.circle")
        notificationButton.contentMode = .scaleAspectFill
        notificationButton.layer.cornerRadius = 20
        notificationButton.clipsToBounds = true
        self.addSubview(notificationButton)
        
        profileImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-50)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

