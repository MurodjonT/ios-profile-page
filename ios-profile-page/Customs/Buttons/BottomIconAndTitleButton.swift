
//
//  bottomIconButton.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 20/12/24.
//
import UIKit

class BottomIconAndTitleButton: ControlButton {
    
    private let borderLayer = CAShapeLayer()
    private let iconImageView = UIImageView()
    private let titleLabel = MLabel(font: UIFont.systemFont(ofSize: 14))
    
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(iconImageView)
        addSubview(titleLabel)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        titleLabel.snp.makeConstraints { make in
            make.top.left.equalTo(8)
            make.size.equalTo(32)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(titleLabel)
        }
    }
    
    func setIconNameAndTitle(iconNmae: String,
                             title: String,
                             titlecolor: UIColor = .black,
                             numberOfLine: Int = 1,
                             isResetConstraints: Bool = true) {
        
        iconImageView.image = UIImage(systemName: iconNmae)
        titleLabel.text = title
        titleLabel.textColor = titlecolor
        titleLabel.numberOfLines = numberOfLine
        
    }
}
