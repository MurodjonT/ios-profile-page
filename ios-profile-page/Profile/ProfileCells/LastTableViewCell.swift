import UIKit
import SnapKit

class LastTableViewCell: UITableViewCell {
    static let identifier: String = "LastTableViewCell"
    
    private let tableView: UITableView = {
          let tableView = UITableView()
          tableView.register(InnerTableViewCell2.self, forCellReuseIdentifier: InnerTableViewCell2.identifier)
          return tableView
      }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemGray6
        setupContainerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContainerView() {
        let containerView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 15
            view.clipsToBounds = true
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.1
            view.layer.shadowOffset = CGSize(width: 0, height: 4)
            view.layer.shadowRadius = 4
            return view
        }()
        
        contentView.addSubview(containerView)
        containerView.addSubview(tableView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        setupTableView()
        
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


extension LastTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: InnerTableViewCell2.identifier, for: indexPath) as! InnerTableViewCell2
          let titles = ["Xavfsizlik", "Ilova tili", "Xabarnoma", "Ko'rinish"]
          let icons = ["lock.shield", "globe", "bell", "sun.min" ]
          cell.configure(with: titles[indexPath.row], iconName: icons[indexPath.row])
          if indexPath.row == 1 {
              cell.addLangLabel()
          } else if indexPath.row == 3 {
              cell.addThemeLabel()
          }
          return cell
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        ViewAnimationForRows.animate(cell: cell)
           
        switch indexPath.row {
        case 0:
            print("Xavfsizlik tanlandi")
        case 1:
            print("Ilova tili tanlandi")
        case 2:
            print("Xabarnoma tanlandi")
        case 3:
            print("Ko'rinish tanlandi")
        default:
            break
        }
    }
}

class InnerTableViewCell2: UITableViewCell {
    static let identifier = "InnerTableViewCell2"

    private let buttonInfo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = .gray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.clipsToBounds = true
        return button
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .orange
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let LangLabel: UILabel = {
        let label = UILabel()
        label.text = "O'zbek"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.isHidden = true
        return label
    }()
    
    private let ThemeLabel: UILabel = {
        let label = UILabel()
        label.text = "Kunduzgi"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.isHidden = true
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(buttonInfo)
        contentView.addSubview(LangLabel)
        contentView.addSubview(ThemeLabel)

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
        
        LangLabel.snp.makeConstraints { make in
            make.trailing.equalTo(buttonInfo.snp.leading).offset(-8)
            make.centerY.equalToSuperview()
        }
        
        ThemeLabel.snp.makeConstraints { make in
            make.trailing.equalTo(buttonInfo.snp.leading).offset(-8)
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
    
    func addLangLabel() {
        LangLabel.isHidden = false
    }
    
    func addThemeLabel() {
        ThemeLabel.isHidden = false
    }
}
