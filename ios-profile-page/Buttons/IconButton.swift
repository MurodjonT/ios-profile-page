
//
//  BMIconButton.swift
//  Daftar
//
//  Created by Samandar Jurayev on 14/05/24.
//

import UIKit

class BMIconButton: BMControl {
    
    var iconSize = CGSize(width: 0, height: 0)
    let iconImageView = UIImageView()
    var isCentre = false
    var isTop = false
    var isLeft = false
    
    init(iconSize: CGSize = CGSize(width: 12, height: 12), isCentre: Bool = false, isTop: Bool = false, isLeft: Bool = false) {
        super.init()
        
        self.iconSize = iconSize
        self.isCentre = isCentre
        self.isTop = isTop
        self.isLeft = isLeft
        
        constraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        addSubview(iconImageView)
    }
    
    private func constraints() {
        
        iconImageView.snp.makeConstraints { make in
            if isCentre {
                make.centerX.equalToSuperview()
                
            } else if isLeft {
                make.left.equalToSuperview()

            } else {
                make.right.equalToSuperview()
            }

            if isTop {
                make.top.equalToSuperview()
                
            } else {
                make.centerY.equalToSuperview()
            }
            
            make.size.equalTo(iconSize)
        }
    }
    
    func resetConstraintsToCentre() {
        iconImageView.snp.remakeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.size.equalTo(iconSize.width)
        }
    }
}
