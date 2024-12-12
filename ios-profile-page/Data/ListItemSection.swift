//
//  ListItemSection.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 11/12/24.
//


import Foundation

enum ListSection {
    case stories([ListItem])
    case popular([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .stories(let items),
                .popular(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .stories:
            return "Stories"
        case .popular:
            return "Popular"
        }
    }
}

