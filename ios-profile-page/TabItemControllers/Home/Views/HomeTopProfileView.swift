////
////  HomeTopProfileView.swift
////  ios-profile-page
////
////  Created by Murodjon Turobov on 07/12/24.
////
//
//import UIKit
//
//
//class HomeTopProfileView: BMView {
//    
//    private let avatarImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 20
//        imageView.layer.masksToBounds = true
//        
//        return imageView
//    }()
//    
//    private let userNameLabel = BMLabel(font: UIFont.systemFont(ofSize: 16), textColor: .black)
//    
//    override func setupSubviews() {
//        super.setupSubviews()
//        
//        addSubview(avatarImageView)
//        addSubview(userNameLabel)
//        
//        
//    }
//    
//    override func setupConstraints() {
//        super.setupConstraints()
//        
//        avatarImageView.snp.makeConstraints { make in
//            make.bottom.equalToSuperview()
//            make.left.equalTo(16)
//            make.size.equalTo(40)
//        }
//        
//        userNameLabel.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().offset(-8)
//            make.left.equalTo(avatarImageView.snp.right).offset(16)
//        }
//        
//    }
//    func setAvatarImage(imageName: String) {
//        avatarImageView.image = UIImage(systemName: imageName)
//    }
//    
//}
