//
//  Untitled.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 17/12/24.
//

import UIKit

class LeftIconAndTitleButton2: ControlButton {
        
    private var imageView = UIImageView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
        
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(imageView)
        addSubview(titleLabel)
    }
        
    override func setupConstraints() {
        super.setupConstraints()
                        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(16)
            make.left.equalTo(12)
        }
       
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(8)
            make.centerY.equalToSuperview()
            make.right.equalTo(-16)
        }
    }
    
    func setTitleAndIconNames(title: String, iconName: String) {
        titleLabel.text = title
        imageView.image = UIImage(systemName: iconName)
    }
    
    func setTitleFontAndColor(font: UIFont, color: UIColor) {
        titleLabel.font = font
        titleLabel.textColor = color
    }
    
    func remakeConstraintsToCenter(iconSize: Int) {
        titleLabel.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        imageView.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(iconSize)
            make.right.equalTo(titleLabel.snp.left).offset(-8)
        }
    }
}

