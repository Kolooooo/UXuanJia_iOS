//
//  UXJHousesSetVC.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/6/1.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//  楼盘套餐

import UIKit

class UXJHousesSetVC: UXJBaseVC, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        //视图布局
        self.createUI()
        
        //注册cellID
        let nib = UINib(nibName: "UXJHousesSetCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "housesSetCell")
        tableView.register(UINib(nibName: "UXJHousesSetHeadCell", bundle: nil), forCellReuseIdentifier: "housesSetHeadCell")
    }

    //MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 320
        }
        return 458
    }
    
    //创建表格单元
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //头部视图
        if indexPath.row == 0 {
            let cell: UXJHousesSetHeadCell = tableView.dequeueReusableCell(withIdentifier: "housesSetHeadCell") as! UXJHousesSetHeadCell
            
            cell.selectionStyle = .none
            
            cell.setBannerView(["ceshi"])
            
            return cell
        }
        
        
        let cell: UXJHousesSetCell = tableView.dequeueReusableCell(withIdentifier: "housesSetCell") as! UXJHousesSetCell
        
        cell.selectionStyle = .none
        
        //传值创建商品，后面换成model
        cell.createList(num: Int(arc4random()%4+1))
        
        cell.toSetDetailBlock = {
            print("查看套餐详情")
        }
        
        cell.buttonBlock = { (tag: Int) in
            print("点击第\(tag)个商品，查看详情")
            let goodsDetailVC = UXJGoodsDetailVC()
            self.navigationController?.pushViewController(goodsDetailVC, animated: true)
        }
        
        return cell
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
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
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
