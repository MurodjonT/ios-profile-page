//
//  TodoViewController.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 31/12/24.
//

import UIKit
import SnapKit

class ToDoCell: UITableViewCell {
    
    static let identifier = "ToDoCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profil"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
//    private let checkMark: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "checkmark")
//        return imageView
//    }()
//    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(checkMark)
//        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(contentView.snp.top).offset(16)
//            make.centerX.equalTo(contentView)
//            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
//        }
//        
//        checkMark.snp.makeConstraints { make in
//            make.top.equalTo(contentView.snp.top).offset(16)
//            make.leading.equalTo(titleLabel.snp.trailing).offset(50)
//            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
//        }
    }

}
