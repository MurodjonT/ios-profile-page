import UIKit
import SnapKit

class QuickServicesView: BMView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // MARK: - Tezkor xizmatlar label
        let titleLabel = UILabel()
        titleLabel.text = "Tezkor xizmatlar"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        addSubview(titleLabel)
        
        // MARK: - QR tugmasi
        let qrButton: LeftIconAndTitleButton = {
            let button = LeftIconAndTitleButton()
            button.setTitleAndIconNames(title: "Mening QR", iconName: "qrcode.viewfinder")
            button.remakeConstraintsToCenter(iconSize: 25)
            button.setTitleFontAndColor(font: UIFont.systemFont(ofSize: 16), color: .black)
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
            button.backgroundColor = .white
            
            button.addTarget(self, action: #selector(qrButtonTapped), for: .touchUpInside)

            return button
        }()
        
        // MARK: - Elektron navbat tugmasi
        let queueButton: LeftIconAndTitleButton = {
            let button = LeftIconAndTitleButton()
            button.setTitleAndIconNames(title: "Elektron navbat", iconName: "list.bullet")
            button.remakeConstraintsToCenter(iconSize: 25)
            button.setTitleFontAndColor(font: UIFont.systemFont(ofSize: 16), color: .black)
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
            button.backgroundColor = .white
            
            button.addTarget(self, action: #selector(queueButtonTapped), for: .touchUpInside)

            return button
        }()
        
        addSubview(qrButton)
        addSubview(queueButton)
        
        // MARK: - Layout constraints
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }
        
        qrButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(60)
            make.width.equalToSuperview().multipliedBy(0.45)
        }
        
        queueButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(60)
            make.width.equalToSuperview().multipliedBy(0.45)
        }
    }

    @objc private func qrButtonTapped() {
        print("Mening QR button tapped")
    }

    @objc private func queueButtonTapped() {
        print("Elektron navbat button tapped")
    }

}

