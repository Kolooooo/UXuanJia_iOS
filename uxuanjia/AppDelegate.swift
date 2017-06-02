//
//  AppDelegate.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/5/26.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //初始化
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        
        let rootVC: UXJRootVC = UXJRootVC()
        window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        
        // MARK: - 结构体
        
        
        // MARK: - 视图属性
        
        // MARK: - 数据属性
        
        // MARK: - 全局变量
        
        
        // MARK: - 视图生命周期
        
        // MARK: - 内部逻辑
        
        // MARK: - 代理方法
        
        // MARK: - 数据请求/数据处理
        
        // MARK: - 视图布局
        // MARK: 视图样式
        // MARK: 视图结构
        // MARK: 视图布局
        // MARK: 视图行为
        
        
        // MARK: - Setter and Getter
        
        // MARK: - 懒加载
        
        
        
        /// ken.todo: 测试请求, 测试完毕就要删除
        networkTest()
        
        
        return true
    }
    
    func networkTest() {
        let params = ["offset" : "0", "limit" : "10"]
        let urlString = "platform/mobile/premises/search"
        UXJRequest.request(type: .GET, classURLString: urlString, parameters: params, success: { (json: [String : Any]) -> Void in
            print(json)
        }, failure: { (error: Error) -> Void in
            print(error)
        })
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

