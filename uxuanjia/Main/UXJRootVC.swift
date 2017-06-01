//
//  UXJRootVC.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/5/26.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//

import UIKit

class UXJRootVC: UIViewController {
    
    public var mainTabBarController = UITabBarController()
    
    private let homeNav: UXJNavigationController = UXJNavigationController.init(rootViewController: UXJHomePageVC())
    
    private let personalNav: UXJNavigationController = UXJNavigationController.init(rootViewController: UXJPersonalCenterVC())

    override func viewDidLoad() {
        super.viewDidLoad()

        //首页
        homeNav.tabBarItem = UITabBarItem.init(title: "首页", image: UIImage(named: "uxj_home_unselect")?.withRenderingMode(.alwaysOriginal), tag: 1000)
        homeNav.tabBarItem.selectedImage = UIImage(named: "uxj_home_select")?.withRenderingMode(.alwaysOriginal)
        
        //个人中心
        personalNav.tabBarItem = UITabBarItem.init(title: "个人中心", image: UIImage(named: "uxj_personal_unselect")?.withRenderingMode(.alwaysOriginal), tag: 1001)
        personalNav.tabBarItem.selectedImage = UIImage(named: "uxj_personal_select")?.withRenderingMode(.alwaysOriginal)
        
        mainTabBarController.viewControllers = [homeNav,personalNav]
        //tabBar不透明
        mainTabBarController.tabBar.isTranslucent = false
        self.view.addSubview(mainTabBarController.view)
        
        //改变tabBarItem文字颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orange], for: .selected)
    }

    

}
