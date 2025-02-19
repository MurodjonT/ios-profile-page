//
//  MiddleInnerTableViewCell.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 05/12/24.
//
import UIKit

class MiddleInnerTableViewCell: UITableViewCell {
    static let identifier = "MiddleInnerTableViewCell"
    
    private lazy var animationContainerView: ViewAnimation = {
        let view = ViewAnimation()
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .orange
        return imageView
    }()
    
    private let buttonInfo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.clipsToBounds = true
        return button
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(animationContainerView)
        animationContainerView.addSubview(iconImageView)
        animationContainerView.addSubview(label)
        animationContainerView.addSubview(buttonInfo)
        
        animationContainerView.snp.makeConstraints { make in
               make.edges.equalToSuperview().inset(10)
           }

        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
        
        buttonInfo.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with text: String, iconName: String) {
        iconImageView.image = UIImage(systemName: iconName)
        label.text = text
    }
}
