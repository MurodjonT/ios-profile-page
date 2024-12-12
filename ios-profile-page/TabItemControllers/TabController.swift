//
//  TabController.swift
//  ios-profile-page
//
//  Created by Murodjon Turobov on 06/12/24.
//
import UIKit

class TabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let viewControllers = TabEnum.allCases.map { tab -> UINavigationController in
            let viewController: UIViewController
            switch tab {
            case .home:
                viewController = ViewController()
                viewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
            case .locations:
                viewController = LocationsController()
                viewController.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "map"), tag: 2)
            case .payments:
                viewController = PaymentsController()
                viewController.tabBarItem = UITabBarItem(title: "Payments", image: UIImage(systemName: "creditcard"), tag: 3)
            case .more:
                viewController = MoreController()
                viewController.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis"), tag: 4)
            }
            return UINavigationController(rootViewController: viewController)
        }
        
        self.setViewControllers(viewControllers, animated: true)
        tabBar.tintColor = .systemBlue
        tabBar.isTranslucent = false
    }
}
