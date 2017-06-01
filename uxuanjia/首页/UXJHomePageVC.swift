//
//  UXJHomePageVC.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/5/26.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//

import UIKit
import SnapKit

class UXJHomePageVC: UXJBaseVC, UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = titleView
        
        self.view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(self.view)
        }
        
        homeTableView.tableFooterView = footerView
        footerView.addSubview(footerImage)
        footerImage.snp.makeConstraints { (make) in
            make.center.equalTo(footerView)
        }
        
        //创建复用的单元格
        let nib = UINib(nibName: "UXJHomePageCell", bundle: nil)
        homeTableView.register(nib, forCellReuseIdentifier: "homepageCell")
        
    }
    
    //tableView相关
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //创建表格单元
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UXJHomePageCell = tableView.dequeueReusableCell(withIdentifier: "homepageCell") as! UXJHomePageCell
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    //点击方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let settingVc = UXJTestVC()
//        navigationController?.pushViewController(settingVc, animated: true)
        
        print(indexPath.row)
    }
    
    //MARK: - lazy methods
    private lazy var homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 318
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    private lazy var titleView: UIImageView = {
        let titleView = UIImageView()
        titleView.image = UIImage(named: "uxj_home_titleView")?.withRenderingMode(.alwaysOriginal)
        titleView.frame = .init(x: 0, y: 0, width: 124, height: 24)
        
        return titleView
    }()
    
//    private lazy var leftButton: UIButton = {
//        let leftButton = UIButton()
//        leftButton.frame = .init(x: 0, y: 0, width: 24, height: 24)
//        leftButton.setImage(UIImage(named: "uxj_arrow_lower"), for: UIControlState.normal)
//        
//        return leftButton
//    }()
    
    private lazy var footerView: UIView = {
        let footerView = UIView()
        footerView.frame = .init(x: 0, y: 0, width: SCREEN_W, height: 84)
        footerView.backgroundColor = rgbColor(red: 246, green: 247, blue: 248)
        
        return footerView
    }()
    
    private lazy var footerImage: UIImageView = {
        let footerImage = UIImageView()
        footerImage.image = UIImage(named: "uxj_home_footerView")?.withRenderingMode(.alwaysOriginal)
        footerImage.frame = .init(x: 0, y: 0, width: 160, height: 24)
       
        return footerImage
    }()
    
    
}
