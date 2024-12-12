//
//  CollectionViewHeaderReusableCell.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 11/12/24.
//

import UIKit
import SnapKit

final class CollectionViewHeaderReusableView: UICollectionReusableView {
    
    // Sarlavha uchun UILabel
    private let cellTitleLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Subviewlarni sozlash
    private func setupViews() {
        addSubview(cellTitleLbl)
        
        // SnapKit yordamida constraintlarni o‘rnatish
        cellTitleLbl.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }
    
    // Header uchun matnni sozlash
    func setup(_ title: String) {
        cellTitleLbl.text = title
    }
}
