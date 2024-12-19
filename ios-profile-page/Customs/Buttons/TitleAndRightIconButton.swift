//
//  TitleAndRightIconButton.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 16/12/24.
//

import UIKit


class TitleAndRightIconButton2: ControlButton {
    
    
    private let stackview = MStackView(axis: .horizontal, distribution: .fill, alignment: .center, spacing: 0)
    private let titleLabel = UILabel()
    private let rightImageView = UIImageView()
    
    
    override func style() {
        super.style()
        
        stackview.isUserInteractionEnabled = false
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(stackview)
        stackview.addArrangedSubview(titleLabel)
        stackview.addArrangedSubview(rightImageView)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        stackview.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(16)
            make.right.equalToSuperview()
        }
        
        rightImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.right.equalToSuperview()
        }
    }
    
    func setTitle(title: String,
                  titleFont: UIFont = UIFont.systemFont(ofSize: 14),
                  titleColor: UIColor = .black,
                  iconName: String = "",
                  tintColor: UIColor = .black,
                  iconColor: UIColor = .black,
                  isSetColorForRightImage: Bool = true,
                  stackSpacing: CGFloat = 0) {
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.font = titleFont
        rightImageView.tintColor = tintColor
        
        if !iconName.isEmpty {
            if isSetColorForRightImage {
                rightImageView.image = UIImage(systemName: iconName)?.withTintColor(iconColor, renderingMode: .alwaysOriginal)
            } else {
                rightImageView.image = UIImage(systemName: iconName)
                rightImageView.snp.remakeConstraints { make in
                    make.size.equalTo(24)
                    make.right.equalToSuperview()
                }
            }
        }
        stackview.spacing = stackSpacing
    }
    
    func removeLeftPaddingOfStackView() {
        stackview.snp.remakeConstraints { make in
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

