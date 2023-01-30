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
        let stopwatchVC = UINavigationController(rootViewController: StopwatchViewController())
        let timerVC = UINavigationController(rootViewController: TimerViewController())
        
        alarmVC.tabBarItem.image = UIImage(systemName: "alarm")
        worldTimeVC.tabBarItem.image = UIImage(systemName: "globe")
        stopwatchVC.tabBarItem.image = UIImage(systemName: "time")
        timerVC.tabBarItem.image = UIImage(systemName: "timer")
        
        alarmVC.title = "Будильник"
        worldTimeVC.title = "Час у світі"
        stopwatchVC.title = "Секундомір"
        timerVC.title = "Таймер"
        
        tabBar.tintColor = .orange
        
        setViewControllers([alarmVC, worldTimeVC, stopwatchVC, timerVC], animated: true)
    }
}
