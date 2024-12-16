import UIKit

class LeftIconAndTitleButton: ControlButton {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        return stack
    }()
    
    override func setupSubviews() {
        super.setupSubviews()
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        addSubview(stackView)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(12)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(16)
        }
    }
    
    func setTitleAndIconNames(title: String, iconName: String) {
        titleLabel.text = title
        imageView.image = UIImage(systemName: iconName)
    }
    
    func setTitleFontAndColor(font: UIFont, color: UIColor) {
        titleLabel.font = font
        titleLabel.textColor = color
    }
    
    func remakeConstraintsToCenter(iconSize: Int) {
        stackView.snp.remakeConstraints { make in
            make.center.equalToSuperview()
        }
        
        imageView.snp.remakeConstraints { make in
            make.size.equalTo(iconSize)
        }
    }
}
