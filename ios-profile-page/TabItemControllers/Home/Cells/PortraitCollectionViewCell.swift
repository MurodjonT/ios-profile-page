//
//  PortraitCollectionViewCell.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 11/12/24.
//

import UIKit
import SnapKit

final class PortraitCollectionViewCell: UICollectionViewCell {
    // Tasvir uchun UIImageView
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // Sarlavha uchun UILabel
    private let cellTitleLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
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
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellTitleLbl)
        
        // SnapKit yordamida constraintlarni o‘rnatamiz
        cellImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview() // Yuqoridan va yonlardan superviewga tegib turadi
            make.height.equalToSuperview().multipliedBy(0.7) // Balandligi 70% bo‘ladi
        }
        
        cellTitleLbl.snp.makeConstraints { make in
            make.top.equalTo(cellImageView.snp.bottom).offset(8) // Tasvirning pastidan 8 pt masofada
            make.leading.trailing.equalToSuperview() // Yonlardan superviewga teng
            make.bottom.equalToSuperview() // Pastki qismga tegib turadi
        }
    }
    
    // Ma'lumotlarni sozlash uchun metod
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellTitleLbl.text = item.title
    }
}
