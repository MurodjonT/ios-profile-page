//
//  ViewController3.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 16/12/24.
//

import UIKit
import SnapKit

class ButtonsViewController: UIViewController {
    
    private var button1: TitleAndRightIconButton2 = {
        let button = TitleAndRightIconButton2()
        button.setTitle(
            title: "Button1",
            titleColor: .white,
            iconName: "square.and.arrow.down.badge.clock",
            tintColor: .white,
            iconColor: .white
        )
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        return button
    }()
    
    private var button2: LeftIconAndTitleButton2 = {
        let button = LeftIconAndTitleButton2()
        button.setTitleAndIconNames(title: "Mening QR", iconName: "qrcode.viewfinder")
        button.remakeConstraintsToCenter(iconSize: 25)
        button.setTitleFontAndColor(font: UIFont.systemFont(ofSize: 16), color: .black)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        
        return button
        
    }()
    
    private var button3: CustomTitleRightIconButton = {
        let button = CustomTitleRightIconButton()
        button.setTitle(title: "Custom Button", iconName: "qrcode.viewfinder")
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        
        return button
        
    }()
    
    private var button4: IconAndQuantityButton = {
        let button = IconAndQuantityButton()
        button.setData(iconName: "bell.circle.fill", quantity: 5)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        
        return button
    }()
    
    private var button5: TopIconAndBottomTitleButton = {
        let button = TopIconAndBottomTitleButton()
        button.setIconNameAndTitle(iconNmae: "highlighter", title: "Top Button")
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        
        return button
    }()
    
    private var button6: BottomIconAndTitleButton = {
        let button = BottomIconAndTitleButton()
        button.setIconNameAndTitle(iconNmae: "highlighter", title: "Bottom Button")
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.backgroundColor = .white
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(button5)
        view.addSubview(button6)
        
        setupTargets()
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        // Button uchun AutoLayout
        button1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        button2.snp.makeConstraints { make in
            make.top.equalTo(button1.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(90)
            make.height.equalTo(50)
        }
        
        button3.snp.makeConstraints { make in
            make.top.equalTo(button2.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(150)
            make.height.equalTo(50)
        }
        
        button4.snp.makeConstraints { make in
            make.top.equalTo(button3.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(335)
            make.height.equalTo(50)
        }
        
        button5.snp.makeConstraints { make in
            make.top.equalTo(button4.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(335)
            make.height.equalTo(100)
        }
        
        button6.snp.makeConstraints { make in
            make.top.equalTo(button5.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(335)
            make.height.equalTo(100)
        }
    }
    
    private func setupTargets() {
        button1.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Action), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Action), for: .touchUpInside)
        button4.addTarget(self, action: #selector(button4Action), for: .touchUpInside)
        button5.addTarget(self, action: #selector(button5Action), for: .touchUpInside)
    }
    
    @objc private func button1Action() {
        showAlert(title: "Button 1", message: "Button 1 tapped")
    }
    @objc private func button2Action() {
        showAlert(title: "Button 2", message: "Button 2 tapped")
    }
    @objc private func button3Action() {
        showAlert(title: "Button 3", message: "Button 3 tapped")
    }
    @objc private func button4Action() {
        showAlert(title: "Button 4", message: "Button 4 tapped")
    }
    @objc private func button5Action() {
        showAlert(title: "Button 5", message: "Button 5 tapped")
    }
    
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
