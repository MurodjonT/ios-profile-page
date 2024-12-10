//
//  CustomHeaderView.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 10/12/24.
//

import UIKit

class HomeTopProfileView: UICollectionReusableView {
    static let identifier = "HomeTopProfileView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Header Title"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10) // Ichki bo'shliqlar
        }
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
