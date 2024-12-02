//
//  BMUicontroll.swift
//  Daftar
//
//  Created by Samandar Jurayev on 14/05/24.
//

import UIKit

class ControlButton: UIControl, ViewProtocol {
    public init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    func highlight() {
        alpha = 0.7
    }
    
    func unHighlight() {
        alpha = 1
    }
    
    open override var isHighlighted: Bool {
        didSet {
            
            if oldValue == false && isHighlighted {
                highlight()
            } else {
                unHighlight()
            }
            
        }
    }
    
    open func setupSubviews() {}
    open func setupConstraints() {}
    open func setupTargets() {}
    open func style() {}
    open func localize() {}
}
//
//  ControlButton.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 29/11/24.
//

