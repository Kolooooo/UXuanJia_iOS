//
//  UXJHomePageVC.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/5/26.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//  楼盘列表

import UIKit
import SnapKit

class UXJHomePageVC: UXJBaseVC, UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //视图布局
        self.createUI()
        
        //创建复用的单元格
        let nib = UINib(nibName: "UXJHomePageCell", bundle: nil)
        homeTableView.register(nib, forCellReuseIdentifier: "homepageCell")
        
    }
    
    //MARK: - tableView
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
        let housesSetVC = UXJHousesSetVC()
        housesSetVC.title = "时代春树里" //测试
        navigationController?.pushViewController(housesSetVC, animated: true)
    }
    
    //MARK: - 视图布局
    func createUI() {
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
        
        //自定义leftBarItem
        leftView.frame = .init(x: 0, y: 0, width: leftLabel.frame.width+18, height: 20)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftView)
        leftView.addSubview(leftLabel)
        leftImage.frame = .init(x: leftView.frame.width-18, y: 1, width: 18, height: 18)
        leftView.addSubview(leftImage)
        leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UXJHomePageVC.selectCity))) //添加点击手势
    }
    
    //选择城市点击方法
    func selectCity(){
        print("点击")
    }
    
    //MARK: - 懒加载
    private lazy var homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 318
        tableView.showsVerticalScrollIndicator = false
        
        return tableView
    }()
    
    //头部视图
    private lazy var titleView: UIImageView = {
        let titleView = UIImageView()
        titleView.image = UIImage(named: "uxj_home_titleView")?.withRenderingMode(.alwaysOriginal)
        titleView.frame = .init(x: 0, y: 0, width: 124, height: 24)
        
        return titleView
    }()
    
    //自定义leftBarItem
    private lazy var leftView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        let title = "广州" //测试数据
        let size = title.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height: 20), options: [NSStringDrawingOptions.usesFontLeading,NSStringDrawingOptions.usesLineFragmentOrigin], attributes: [NSFontAttributeName:getFont(16)], context: nil).size //宽度自适应
        label.text = title
        label.frame = .init(x: 0, y: 0, width: size.width+1, height: 20)
        label.font = getFont(16)
        
        return label
    }()
    
    private lazy var leftImage: UIImageView = {
        let leftImage = UIImageView()
        leftImage.image = UIImage(named: "uxj_arrow_lower")?.withRenderingMode(.alwaysOriginal)
        
        return leftImage
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
