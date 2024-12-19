//
//  IconAndQuantityButton.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 18/12/24.
//

import UIKit

class IconAndQuantityButton: ControlButton {
    
    private let imageView = UIImageView()
    private let quantityLabel = MLabel(font: UIFont.systemFont(ofSize: 16), insets: UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 4))
    
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(imageView)
        addSubview(quantityLabel)
        
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(32)
        }
    }
    
    override func style() {
        super.style()
        
        quantityLabel.backgroundColor = .black
    }
    
    func setData(iconName: String = "", quantity: Int, quantityColor: UIColor = .black) {
        imageView.image = UIImage(systemName: iconName)
        
        quantityLabel.text = quantity > 99 ? "\(90)" : "\(quantity)"
        quantityLabel.textColor = quantityColor
        
        quantityLabel.layer.cornerRadius = quantityLabel.intrinsicContentSize.width/2
        quantityLabel.layer.masksToBounds = true
        
        quantityLabel.snp.remakeConstraints { make in
            make.centerY.equalTo(imageView.snp.top)
            make.centerX.equalTo(imageView.snp.right)
            make.width.height.equalTo(quantityLabel.intrinsicContentSize.width)
        }
        
    }
    
    func reSetIconSize(iconSize: Int) {
        imageView.snp.remakeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.size.equalTo(iconSize)
            
        }
    }
}
