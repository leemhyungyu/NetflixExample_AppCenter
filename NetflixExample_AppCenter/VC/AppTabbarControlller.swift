//
//  AppTabbarControlller.swift
//  NetflixExample_AppCenter
//
//  Created by 임현규 on 2022/05/08.
//

import UIKit

class AppTabbarController: UITabBarController {
    
    let homeVC = HomeViewController()
    let searchVC = SearchViewController()
    let commingVC = CommingViewController()
    let saveVC = SaveViewController()
    let settingVC = SettingViewController()
    
    
    let homeTab: UITabBarItem = {
       
        let tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        return tabBarItem
        
    }()
    
    let searchTab: UITabBarItem = {
       
        let tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        return tabBarItem
    }()
    
    let commingTab: UITabBarItem = {
       
        let tabBarItem = UITabBarItem(title: "공계예정", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        
        return tabBarItem
    }()
    
    let saveTab: UITabBarItem = {
       
        let tabBarItem = UITabBarItem(title: "저장한 콘텐츠 목록", image: UIImage(systemName: "square.and.arrow.down"), selectedImage: UIImage(systemName: "square.and.arrow.down"))
        
        return tabBarItem
    }()
    
    let settingTab: UITabBarItem = {
       
        let tabBarItem = UITabBarItem(title: "더보기", image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.fill"))
        
        return tabBarItem
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
        // Do any additional setup after loading the view.
    }
    
    func setting() {
        
        tabBar.tintColor = .systemGray
        viewControllers = [homeVC, searchVC, commingVC, saveVC, settingVC]
        
        homeVC.tabBarItem = homeTab
        searchVC.tabBarItem = searchTab
        commingVC.tabBarItem = commingTab
        saveVC.tabBarItem = saveTab
        settingVC.tabBarItem = settingTab
        
        
    }
}
