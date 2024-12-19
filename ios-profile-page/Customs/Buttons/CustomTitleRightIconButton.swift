//
//  CustomTitleRightIconButton.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 17/12/24.
//

import UIKit

class CustomTitleRightIconButton: ControlButton {
    
    private let titleLabel = UILabel()
    private let rightImageView = UIImageView()
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(titleLabel)
        addSubview(rightImageView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
            make.right.equalTo(-40)
        }
        
        rightImageView.snp.makeConstraints { make in
            make.right.equalTo(-16)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)
        }
    }
    
    override func style() {
        super.style()
        
        titleLabel.lineBreakMode = .byTruncatingTail
    }
    
    func setTitle(title: String,
                  titleFont: UIFont = UIFont.systemFont(ofSize: 14),
                  titleColor: UIColor = .black,
                  iconName: String = "",
                  iconColor: UIColor = .black,
                  tintColor: UIColor = .black) {
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        rightImageView.tintColor = tintColor
        rightImageView.image = UIImage(systemName: iconName)?.withTintColor(iconColor, renderingMode: .alwaysOriginal)
    }
}

