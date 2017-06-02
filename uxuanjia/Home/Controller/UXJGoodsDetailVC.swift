//
//  UXJGoodsDetailVC.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/6/2.
//
// 商品详情

import UIKit

class UXJGoodsDetailVC: UXJBaseVC, UITableViewDelegate, UITableViewDataSource  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //视图布局
        self.createUI()
        
        //注册cellID
        tableView.register(UINib(nibName: "UXJGoodsDetailFirstCell", bundle: nil), forCellReuseIdentifier: "goodsDetailFirstCell")
        tableView.register(UINib(nibName: "UXJGoodsDetailSecondCell", bundle: nil), forCellReuseIdentifier: "goodsDetailSecondCell")
        
    }
    
    //MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            
            return 392
            
        case 1:
            
            return 348
            
        case 2:
            
            return 100
            
        default:
            
            return 100
            
        }

    }
    
    
    
    //创建表格单元
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell: UXJGoodsDetailFirstCell = tableView.dequeueReusableCell(withIdentifier: "goodsDetailFirstCell") as! UXJGoodsDetailFirstCell
            
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            let cell: UXJGoodsDetailSecondCell = tableView.dequeueReusableCell(withIdentifier: "goodsDetailSecondCell") as! UXJGoodsDetailSecondCell
            
            cell.selectionStyle = .none
            
            return cell
            
//        case 2:
//            
//            return UITableViewCell()
            
        default:
            
            return UITableViewCell()
            
        }
        
    }
    
    //MARK: - 视图布局
    func createUI() {
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(self.view)
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

    
    
    
    
    
    
    
    
    
    
    
    
    
}
