//
//  SceneDelegate.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 26/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TabController()
        window?.makeKeyAndVisible()
     
        
    }
}

