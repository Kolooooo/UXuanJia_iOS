//
//  UXJBaseVC.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/5/26.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//

import UIKit

class UXJBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = rgbColor(red: 246, green: 247, blue: 248)
        
        //导航栏不透明
        self.navigationController?.navigationBar.isTranslucent = false
        
    }

    

}
