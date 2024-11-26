import UIKit
import SnapKit

class TopProfileInfoCell: UITableViewCell {
    static let identifier = "TopProfileInfoCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Profil"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40 // Circular avatar
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "avatar")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Alisher Ziyadov"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let buttonInfo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = .systemOrange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.clipsToBounds = true
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.clipsToBounds = true
        return button
    }()
    
    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Passport ma'lumotlari"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemOrange
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(cancelButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(containerView)
        containerView.addSubview(avatarImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(detailsLabel)
        containerView.addSubview(buttonInfo)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaInsets.top).offset(16)
            make.leading.equalTo(16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaInsets.top).offset(16)
            make.centerX.equalTo(contentView)
        }
        
        containerView.snp.makeConstraints { make in
            make.center.equalTo(contentView)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.6)
            make.bottom.equalTo(-10)
           }

        avatarImageView.snp.makeConstraints { make in
            make.centerX.equalTo(containerView)
            make.top.equalTo(containerView.snp.top).offset(16)
            make.top.equalTo(-50)
            make.width.height.equalTo(100) // Circular avatar size
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(containerView).inset(16)
        }

        detailsLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(containerView).inset(16)
        }
        
        buttonInfo.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(12.5)
            make.leading.equalTo(containerView.snp.leading).offset(295)
            
            
        }
    }
}
