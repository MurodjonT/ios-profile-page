import UIKit
import SnapKit

class LastTableViewCell: UITableViewCell {
    static let identifier: String = "LastTableViewCell"
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(LastInnerTableViewCell.self, forCellReuseIdentifier: LastInnerTableViewCell.identifier)
        return tableView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemGray6
        contentView.addSubview(tableView)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: LastInnerTableViewCell.identifier, for: indexPath) as! LastInnerTableViewCell
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
        tableView.deselectRow(at: indexPath, animated: false)
        //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print("")
        //    }
    }
}



