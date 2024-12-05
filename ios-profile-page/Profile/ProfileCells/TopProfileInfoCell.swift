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
    
    private let closeButton: IconButton = {
        let button = IconButton(iconSize: CGSize(width: 20, height: 20), isTop: true, isLeft: true)
           button.iconImageView.image = UIImage(systemName: "xmark")
           button.iconImageView.tintColor = .gray
           return button
       }()

    private let detailsButton: TitleAndRightIconButton = {
        let button = TitleAndRightIconButton()
        button.setTitle(
            title: "Passport ma'lumotlari",
            titleFont: .systemFont(ofSize: 16),
            titleColor: .systemOrange,
            iconName: "chevron.forward",
            iconColor: .systemOrange
        )
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(closeButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(containerView)
        containerView.addSubview(avatarImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(detailsButton)
        setupConstraints()
        
        detailsButton.addTarget(self, action: #selector(navigateToPassportView), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        closeButton.snp.makeConstraints { make in
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

        detailsButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(100)
        }
    }
    
    @objc func navigateToPassportView() {
        guard let parentViewController = self.parentViewController else { return }
        let nextViewController = PassportView()
        nextViewController.modalPresentationStyle = .fullScreen
        parentViewController.present(nextViewController, animated: true, completion: nil)
    }
}

extension UIView {
var parentViewController: UIViewController? {
    var parentResponder: UIResponder? = self
    while let responder = parentResponder {
        parentResponder = responder.next
        if let viewController = parentResponder as? UIViewController {
            return viewController
            }
        }
    return nil
    }
}
