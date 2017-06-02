//
//  UXJGoodsDetailFirstCell.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/6/2.
//
//

import UIKit

class UXJGoodsDetailFirstCell: UITableViewCell {

    //图片
    @IBOutlet weak var headImage: UIImageView!
    //标题
    @IBOutlet weak var titleLabel: UILabel!
    //内容
    @IBOutlet weak var secondLabel: UILabel!
    //价格
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
