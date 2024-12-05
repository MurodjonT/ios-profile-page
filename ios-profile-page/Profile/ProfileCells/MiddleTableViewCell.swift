import UIKit
import SnapKit

class MiddleTableViewCell: UITableViewCell {
    static let identifier = "MiddleTableViewCell"

    private let tableView = UITableView()
    private let containerView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemGray6
        contentView.addSubview(tableView)
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    private func setupContainerView() {
//        containerView.backgroundColor = .white
//        containerView.layer.cornerRadius = 15
//        containerView.clipsToBounds = true
//        containerView.layer.shadowColor = UIColor.black.cgColor
//        containerView.layer.shadowOpacity = 0.1
//        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
//        containerView.layer.shadowRadius = 4
//
//
//    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MiddleInnerTableViewCell.self, forCellReuseIdentifier: MiddleInnerTableViewCell.identifier)
    
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


extension MiddleTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MiddleInnerTableViewCell.identifier, for: indexPath) as! MiddleInnerTableViewCell
        let titles = ["QR kodlar hujjati", "To'lovlar tarixi", "Arizalarim"]
        let icons = ["qrcode", "list.bullet", "doc.text"]
        cell.configure(with: titles[indexPath.row], iconName: icons[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//        guard let cell = tableView.cellForRow(at: indexPath) else { return }
//        ViewAnimationForRows.animate(cell: cell)
//           
//        switch indexPath.row {
//        case 0:
//            print("QR kodlar")
//        case 1:
//            print("Tolovlar tarixi")
//        case 2:
//            print("Arizalarim")
//        default:
//            break
//        }
//    }
}


