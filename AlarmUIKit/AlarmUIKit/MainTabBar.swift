//
//  MainTabBar.swift
//  AlarmUIKit
//
//  Created by Алина Власенко on 27.01.2023.
//

import UIKit

class MainTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        
        let alarmVC = UINavigationController(rootViewController: ViewController())
        let worldTimeVC = UINavigationController(rootViewController: WorldTimeViewController())
        
        alarmVC.tabBarItem.image = UIImage(systemName: "alarm")
        worldTimeVC.tabBarItem.image = UIImage(systemName: "worldtime")
        
        alarmVC.title = "Будильник"
        worldTimeVC.title = "Час у світі"
        
        tabBar.tintColor = .orange
        
        setViewControllers([alarmVC, worldTimeVC], animated: true)
    }
}
