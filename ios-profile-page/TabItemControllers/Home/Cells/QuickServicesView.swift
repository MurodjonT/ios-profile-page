//
// FastServicesCell.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 11/12/24.
//

import UIKit
import SnapKit

class QuickServicesView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        // Sarlavha uchun Label
        let titleLabel = UILabel()
        titleLabel.text = "Tezkor xizmatlar"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // "Mening QR" tugmasi
        let qrButton = createButton(title: "Mening QR", imageName: "qr.image")
        qrButton.addTarget(self, action: #selector(qrButtonTapped), for: .touchUpInside)

        // "Elektron navbat" tugmasi
        let queueButton = createButton(title: "Elektron navbat", imageName: "queue.image")
        queueButton.addTarget(self, action: #selector(queueButtonTapped), for: .touchUpInside)

        // Tugmalar uchun StackView
        let buttonStackView = UIStackView(arrangedSubviews: [qrButton, queueButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 16
        buttonStackView.distribution = .fillEqually        
        // Barcha komponentlarni qo'shish
        addSubview(titleLabel)
        addSubview(buttonStackView)
        
        // Constraintlar
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16) // Chap tomondan 16 pt
            make.bottom.equalTo(buttonStackView.snp.top).offset(-15) // buttonStackView'dan 15 pt yuqorida
        }

        buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16) // titleLabel'dan 16 pt pastda
            make.leading.equalToSuperview().offset(16) // Chap tomondan 16 pt
            make.trailing.equalToSuperview().offset(-16) // O‘ng tomondan 16 pt
            make.bottom.equalToSuperview().offset(-16) // Superview'dan 16 pt past
        }

    }
    
    @objc private func qrButtonTapped() {
        print("Mening QR button tapped")
    }

    @objc private func queueButtonTapped() {
        print("Elektron navbat button tapped")
    }
    
    private func createButton(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return button
    }
}

