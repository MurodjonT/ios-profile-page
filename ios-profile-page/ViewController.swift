import UIKit
import SnapKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let topContainer = UIView()
        topContainer.backgroundColor = .systemGray5
        topContainer.layer.cornerRadius = 15
        topContainer.layer.borderWidth = 1
        topContainer.layer.borderColor = UIColor.systemGray3.cgColor
        view.addSubview(topContainer)
        topContainer.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
        
        let middleContainer = UIView()
        middleContainer.backgroundColor = .systemGray5
        middleContainer.layer.cornerRadius = 15
        middleContainer.layer.borderWidth = 1
        middleContainer.layer.borderColor = UIColor.systemGray3.cgColor
        view.addSubview(middleContainer)
        middleContainer.snp.makeConstraints { make in
            make.bottom.equalTo(topContainer).offset(70)
            make.leading.equalToSuperview().offset(75)
            make.height.equalTo(50)
            make.width.equalTo(250)
        }
        
        let customButton1 = LeftIconTitleAndRightIconButton()
        customButton1.setData(leftIcon: "left_icon", text: "Ishonch denov 250 ", rightIcon: "right_icon")
        topContainer.addSubview(customButton1)

        customButton1.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(240)
        }
        
       
        
        let customButton2 = LeftIconTitleAndRightIconButton()
        customButton2.setData(leftIcon: "left_icon", text: "Ishonch denov 250 ", rightIcon: "right_icon")
        middleContainer.addSubview(customButton2)

        customButton2.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(240)
        }
    }
}
