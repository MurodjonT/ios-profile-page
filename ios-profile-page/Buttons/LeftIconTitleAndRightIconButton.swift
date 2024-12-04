//
//  Untitled.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 29/11/24.
//

import UIKit

class LeftIconTitleAndRightIconButton: ControlButton {
    
    private let leftImageView = UIImageView()
    private let textLabel = BMLabel()
    private let rightImageView = UIImageView()
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(leftImageView)
        addSubview(textLabel)
        addSubview(rightImageView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        leftImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.size.equalTo(32)
        }
        
        textLabel.snp.makeConstraints { make in
            make.centerY.equalTo(leftImageView)
            make.left.equalTo(leftImageView.snp.right).offset(8)
            make.right.equalTo(rightImageView.snp.left).offset(-8)
        }
        
        rightImageView.snp.makeConstraints { make in
            make.centerY.equalTo(leftImageView)
            make.right.equalToSuperview()
            make.size.equalTo(18)
        }
    }
    
    func setData(leftIcon: String,
                 text: String,
                 textColor: UIColor = .black,
                 textFont: UIFont = .systemFont(ofSize: 16),
                 textAlignment: NSTextAlignment = .left,
                 rightIcon: String) {
        
        leftImageView.image = UIImage(systemName: "storefront")
        leftImageView.tintColor = .gray
        rightImageView.image = UIImage(systemName: "chevron.compact.right")
        rightImageView.tintColor = .gray
        
        textLabel.text = text
        textLabel.textColor = textColor
        textLabel.font = textFont
        textLabel.textAlignment = textAlignment
        
        if rightIcon.isEmpty {
            rightImageView.isHidden = true
        }
    }
    
    func remakeLeftIconConstraints(size: Float) {
        leftImageView.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.size.equalTo(size)
        }
    }
    
    func remakeRightIconConstraints(size: Float) {
        rightImageView.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.size.equalTo(size)
        }
    }
}
