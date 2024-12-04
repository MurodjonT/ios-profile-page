//
//  TitleRightIcon.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 04/12/24.
//

import UIKit

class TitleAndRightIconButton: ControlButton {
    
    private let stackView = StackView(axis: .horizontal, distribution: .fill, alignment: .center, spacing: 0)
    private let titleLabel = UILabel()
    private let rightImageView = UIImageView()
    
    
    override func style() {
        super.style()
        
        stackView.isUserInteractionEnabled = false
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(rightImageView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview()
        }
        
        rightImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.right.equalToSuperview()
        }
    }
    
//    func setTitle(title: String,
//                  titleFont: UIFont = .systemFont(ofSize: 14),
//                  titleColor: UIColor = .black,
//                  iconName: String = "",
//                  iconColor: UIColor = .black,
//                  tintColor: UIColor = .black,
//                  isSetColorForRightImage: Bool = true,
//                  stackSpacing: CGFloat = 0) {
//        titleLabel.text = title
//        titleLabel.textColor = titleColor
//        titleLabel.font = titleFont
//        rightImageView.tintColor = tintColor
//        
//        if !iconName.isEmpty {
//            if isSetColorForRightImage {
//                rightImageView.image = UIImage(named: iconName)?.withTintColor(iconColor, renderingMode: .alwaysOriginal)
//                
//            } else {
//                rightImageView.image = UIImage(named: iconName)
//                rightImageView.snp.remakeConstraints { make in
//                    make.size.equalTo(24)
//                    make.right.equalToSuperview()
//                }
//
//            }
//        }
//        
//        stackView.spacing = stackSpacing
//    }
    
    
    func setTitle(title: String,
                  titleFont: UIFont = .systemFont(ofSize: 12),
                  titleColor: UIColor = .black,
                  iconName: String = "",
                  iconColor: UIColor = .black,
                  tintColor: UIColor = .black,
                  isSetColorForRightImage: Bool = true,
                  stackSpacing: CGFloat = 0) {
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        
        if !iconName.isEmpty {
            if let systemIcon = UIImage(systemName: iconName) {
                rightImageView.image = systemIcon
                rightImageView.tintColor = iconColor
            }
        }
        
        stackView.spacing = stackSpacing
    }

    
    func removeLeftPaddingOfStackView() {
        stackView.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    func reSetIconSize(size: Float) {
        rightImageView.snp.remakeConstraints { make in
            make.size.equalTo(size)
            make.right.equalToSuperview()
        }
    }
}

