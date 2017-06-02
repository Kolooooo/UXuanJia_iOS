//
//  UXJNavigationController.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/5/26.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//

import UIKit

class UXJNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "uxj_back")?.resizableImage(withCapInsets: UIEdgeInsetsMake(0, 18, 0, 0))
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-1000, 0), for: .default)    // 让导航条返回键带的title消失!
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(img, for: .normal, barMetrics: .default)
        
    }
    
    //重写push方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }else {
            viewController.hidesBottomBarWhenPushed = false
        }
        super.pushViewController(viewController, animated: true)
    }
}
