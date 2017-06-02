//
//  UXJHomePageCell.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/5/26.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//

import UIKit

//首页楼盘列表cell
class UXJHomePageCell: UITableViewCell {

    //图片
    @IBOutlet weak var headImage: UIImageView!
    //标题
    @IBOutlet weak var title: UILabel!
    //简介
    @IBOutlet weak var intro: UILabel!
    
    //白色背景，加阴影
    @IBOutlet weak var whiteView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        whiteView.layer.shadowOffset = CGSize(width: 1, height: 1) //偏移
        whiteView.layer.shadowOpacity = 0.1 //阴影透明度
        whiteView.layer.shadowRadius = 1 //阴影半径
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
