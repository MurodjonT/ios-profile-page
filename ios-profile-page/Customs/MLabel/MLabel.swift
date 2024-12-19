//
//  BMLabel.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 02/12/24.

import UIKit

open class MLabel: UILabel, ViewProtocol {
    
    open var insets: UIEdgeInsets = .zero
    
    public init(_ text: String? = "MLabel",
                font: UIFont? = nil,
                textColor: UIColor = .darkText,
                textAlignment: NSTextAlignment = .left,
                numberOfLines: Int = 1,
                backgroundColor: UIColor = .clear,
                insets: UIEdgeInsets = .zero) {
        
        super.init(frame: .zero)

        self.insets = insets
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.text = text
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        if let font = font {
            self.font = font
        }
        
        setup()
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    open override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    open override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + insets.left + insets.right,
                      height: size.height + insets.top + insets.bottom)
    }
    
    open func setupTargets() {
        
    }
    
    open func setupSubviews() {
        
    }
    
    open func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    open func style() {
        self.adjustsFontSizeToFitWidth = false
        self.minimumScaleFactor = 0.7
    }
    
    open func localize() {
        
    }
}
