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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(titleLabel)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.centerX.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom).offset(-16)
        }
    }

}
