//
//  UXJHousesSetVC.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/6/1.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//  楼盘套餐

import UIKit

//宽高比
private let scale = 375/320

class UXJHousesSetVC: UXJBaseVC, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        //视图布局
        self.createUI()
        
        //创建复用的单元格
        let nib = UINib(nibName: "UXJHousesSetCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "housesSetCell")
    }

    //MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    //创建表格单元
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UXJHousesSetCell = tableView.dequeueReusableCell(withIdentifier: "housesSetCell") as! UXJHousesSetCell
        
        cell.selectionStyle = .none
        
        //传值创建商品，后面换成model
        cell.createList(num: 4)
        
        cell.toSetDetailBlock = {
            print("查看套餐详情")
        }
        
        cell.buttonBlock = { (tag: Int) in
            print("点击第\(tag)个商品，查看详情")
        }
        
        return cell
    }
    
    //点击方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let settingVc = UXJTestVC()
        //        navigationController?.pushViewController(settingVc, animated: true)
        
        print(indexPath.row)
    }

    //MARK: - 视图布局
    func createUI() {
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(self.view)
        }
        
        tableView.tableFooterView = footerView
        footerView.addSubview(footerImage)
        footerImage.snp.makeConstraints { (make) in
            make.center.equalTo(footerView)
        }
    }
    
    //MARK: - 懒加载
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 458
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    //头部视图
    private lazy var headView: UIView = {
        let view = UIView()
        view.frame = .init(x: 0, y: 0, width: SCREEN_W, height: 84)
        
        return view
    }()
    
    //尾部视图
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
