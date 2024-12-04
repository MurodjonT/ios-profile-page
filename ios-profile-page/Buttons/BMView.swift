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
    public init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupSubviews() {}
    
    public func setupConstraints() {}
    
    public func setupTargets() {}
    
    public func style() {}
    
    public func localize() {}
}


