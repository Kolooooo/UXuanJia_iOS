//
//  UXJHousesSetCell.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/6/1.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//

import UIKit

//楼盘套餐cell
class UXJHousesSetCell: UITableViewCell {
    //白色背景，加阴影
    @IBOutlet weak var bgView: UIView!
    //图片
    @IBOutlet weak var headImage: UIImageView!
    //商品列表
    @IBOutlet weak var listView: UIView!
    //标题
    @IBOutlet weak var titleLabel: UILabel!
    //价格
    @IBOutlet weak var priceLabel: UILabel!
    //赠送U币
    @IBOutlet weak var UcoinLabel: UILabel!
    //查看套餐详情block
    var toSetDetailBlock: (()->())?
    //商品详情block
    typealias buttonBlock = (_ tag: Int) -> ()
    var buttonBlock: buttonBlock?
    
    //查看套餐详情
    @IBAction func toSetDetail(_ sender: UIButton) {
        if toSetDetailBlock != nil {
            toSetDetailBlock!()
        }
    }
    
    //创建展示商品
    func createList(num: Int) {
        
        for index in 0..<num {
            let size = (SCREEN_W-52-9*3)/4
            let x = CGFloat(index)*(size+9)
            let button = UIButton()
            button.frame = CGRect.init(x: x, y: 0, width: size, height: size)
            button.tag = index
            button.backgroundColor = UIColor.red
//            button.backgroundColor = rgbColor(red: CGFloat(arc4random()%256), green: CGFloat(arc4random()%256), blue: CGFloat(arc4random()%256))
            button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
            
            listView.addSubview(button)
        }
    }
    
    //商品详情
    func buttonClick(_ sender: UIButton) {
        if self.buttonBlock != nil {
            self.buttonBlock!(sender.tag)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.layer.shadowOffset = CGSize(width: 1, height: 1) //偏移
        bgView.layer.shadowOpacity = 0.1 //阴影透明度
        bgView.layer.shadowRadius = 1 //阴影半径
        bgView.layer.cornerRadius = 5 //圆角
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
