//
//  MockData.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 11/12/24.
//

import Foundation

struct MockData {
    static let shared = MockData()
    
    private let stories: ListSection = {
        .stories([.init(title: "", image: "profile-1"),
                  .init(title: "", image: "profile-2"),
                  .init(title: "", image: "profile-3"),
                  .init(title: "", image: "profile-4"),
                  .init(title: "", image: "profile-5"),
                  .init(title: "", image: "profile-6"),
                  .init(title: "", image: "profile-7"),
                  .init(title: "", image: "profile-8")])
    }()
    
    private let popular: ListSection = {
        .popular([.init(title: "Naruto", image: "popular-1"),
                  .init(title: "Jujutsu Kaisen", image: "popular-2"),
                  .init(title: "Demon Slayer", image: "popular-3"),
                  .init(title: "One Piece", image: "popular-4"),
                  .init(title: "Seven Deadly Sins", image: "popular-5")])
    }()
    
    var pageData: [ListSection] {
        [stories, popular]
    }
}
