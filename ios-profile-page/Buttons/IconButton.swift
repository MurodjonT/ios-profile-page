import UIKit
import SnapKit

class IconButton: UIButton {
    private let containerView = ViewAnimation()
    private let iconImageView = UIImageView()
    private let customTitleLabel = UILabel()
    private let forwardButton = UIImageView()

    init(iconSize: CGSize, isCentre: Bool) {
        super.init(frame: .zero)
        setupView(iconSize: iconSize, isCentre: isCentre)
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(iconSize: CGSize, isCentre: Bool) {
         addSubview(containerView)
         containerView.addSubview(iconImageView)
         containerView.addSubview(customTitleLabel)
        containerView.addSubview(forwardButton)
         
         containerView.layer.cornerRadius = 10
         containerView.clipsToBounds = true
         containerView.backgroundColor = .systemGray5
         
         // Qo'shimcha: containerView ga border qo'shamiz
         containerView.layer.borderWidth = 0.5 // Chegaraning qalinligi
         containerView.layer.borderColor = UIColor.systemGray3.cgColor // Chegaraning rangi (ajralib tursin uchun qora rang)

         // containerView constraints
         containerView.snp.makeConstraints { make in
             make.top.bottom.equalToSuperview().inset(10) // top va bottomda biroz joy qoldirish uchun offset qo'shildi
             make.leading.equalToSuperview().offset(5) // chap tomonda 5 piksel joy qoldirish
             make.trailing.equalToSuperview().offset(-5) // o'ng tomonda 5 piksel joy qoldirish
         }

         // iconImageView settings
         iconImageView.contentMode = .scaleAspectFit
        
         
         // iconImageView constraints
         iconImageView.snp.makeConstraints { make in
             make.size.equalTo(iconSize)
             make.leading.equalToSuperview().offset(5)
             make.centerY.equalToSuperview()
         }
         
         // customTitleLabel settings
         customTitleLabel.textAlignment = .left
         customTitleLabel.font = UIFont.systemFont(ofSize: 14)
         
         // customTitleLabel constraints
         customTitleLabel.snp.makeConstraints { make in
             make.leading.equalTo(iconImageView.snp.trailing).offset(10)
             make.trailing.equalToSuperview().offset(-15)
             make.centerY.equalToSuperview()
         
         }
        
        forwardButton.image = UIImage(systemName: "chevron.compact.forward")
        forwardButton.tintColor = .systemGray
            
            // forwardButton constraints
        forwardButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 15, height: 15))
            make.leading.equalTo(customTitleLabel.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
}
    

//    
    @objc private func buttonClicked() {
        print("Icon button clicked")
    }
    
    var icon: UIImage? {
        get { iconImageView.image }
        set { iconImageView.image = newValue }
    }
    
    var titleText: String? {
        get { customTitleLabel.text }
        set { customTitleLabel.text = newValue }
    }
}

