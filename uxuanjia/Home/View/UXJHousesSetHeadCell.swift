//
//  UXJHousesSetHeadCell.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/6/2.
//
//

import UIKit

//楼盘套餐头部cell
class UXJHousesSetHeadCell: UITableViewCell {

    //用于添加scrollview
    @IBOutlet weak var bgView: UIView!
    //标题
    @IBOutlet weak var titleLabel: UILabel!
    //副标题
    @IBOutlet weak var secondLabel: UILabel!
    
    //轮播图
    func setBannerView(_ comArr: Array<String>) {
        
        if comArr.count == 1 {//只有一张图片
            
            bgView.addSubview(singleImage)
            singleImage.image = UIImage(named: comArr[0])
            
        } else {//多张
            
            bgView.addSubview(scrollView)
            //FIXME : - 轮播图没做
            
        }
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    //轮播图
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = .init(x: 0, y: 10, width: SCREEN_W, height: 180)
        
        return scrollView
    }()
    
    private lazy var singleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = .init(x: 0, y: 0, width: SCREEN_W, height: 190)
        
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
