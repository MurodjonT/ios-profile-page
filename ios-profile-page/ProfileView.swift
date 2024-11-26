//
//  ViewController.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 26/11/24.
//
import UIKit
import SnapKit

class ProfileView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.register(TopProfileInfoCell.self, forCellReuseIdentifier: TopProfileInfoCell.identifier)
        self.register(MiddleTabelViewCell.self , forCellReuseIdentifier: MiddleTabelViewCell.identifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
                switch ProfileEnum(rawValue: indexPath.section) {
                case .topInfoCell:
                    return 300
                default:
                    return 250
                }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = ProfileEnum(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch sectionType {
        case .topInfoCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopProfileInfoCell.identifier, for: indexPath) as! TopProfileInfoCell
            return cell
        case .middleInfoCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: MiddleTabelViewCell.identifier, for: indexPath) as! MiddleTabelViewCell
            return cell
    
        }
    }
}

