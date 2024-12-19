//
//  BMView.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 29/11/24.


import UIKit

public protocol ViewProtocol {
    func setup()
    func setupSubviews()
    func setupConstraints()
    func setupTargets()
    func style()
    func localize()
}

extension ViewProtocol where Self: UIView {
    public func setup() {
        setupSubviews()
        setupConstraints()
        
        setupTargets()
        style()
        localize()
    }
}

class BMView: UIView, ViewProtocol {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public func setupSubviews() {}
    
    public func setupConstraints() {}
    
    public func setupTargets() {}
    
    public func style() {}
    
    public func localize() {}
}
