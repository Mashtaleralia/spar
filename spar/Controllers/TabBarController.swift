//
//  TabBarController.swift
//  spar
//
//  Created by Admin on 11.08.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
        UITabBar.appearance().barTintColor = .green
    }
    
    private func setUpTabs() {
        let mainVC = ViewController()
        let catalogVC = UIViewController()
        let cartVC = UIViewController()
        let profileVC = UIViewController()
        
        let nav1 = UINavigationController(rootViewController: mainVC)
        let nav2 = UINavigationController(rootViewController: catalogVC)
        let nav3 = UINavigationController(rootViewController: cartVC)
        let nav4 = UINavigationController(rootViewController: profileVC)
        nav1.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Каталог", image: UIImage(systemName: "square.grid.2x2"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "cart"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 4)
        
        setViewControllers([nav1, nav2, nav3, nav4], animated: false)
    }
}
