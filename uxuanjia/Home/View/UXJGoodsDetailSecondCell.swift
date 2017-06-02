//
//  UXJGoodsDetailSecondCell.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/6/2.
//
//

import UIKit

class UXJGoodsDetailSecondCell: UITableViewCell {

    //商品编号
    @IBOutlet weak var goodNumber: UILabel!
    //材质
    @IBOutlet weak var materials: UILabel!
    //尺寸
    @IBOutlet weak var size: UILabel!
    //产地
    @IBOutlet weak var origin: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let arr: NSArray = []
        //画虚线
        let lineView:UIView = UIView(frame: CGRect(x: 20, y: 200, width: self.contentView.frame.width-40, height: 20))
        self.contentView.addSubview(lineView)
        
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.contentView).offset(20)
            make.top.equalTo(goodNumber).offset(13)
            make.bottom.equalTo(materials).offset(35)
        }
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        
        shapeLayer.bounds = lineView.bounds
        
        shapeLayer.position = CGPoint(x: lineView.frame.width / 2, y: lineView.frame.height / 2)
        
        shapeLayer.fillColor = UIColor.clear.cgColor  //设置填充色
        shapeLayer.strokeColor = UIColor.lightGray.cgColor  //线的颜色
        
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPhase = 0
        shapeLayer.lineDashPattern = [NSNumber(value: 6), NSNumber(value: 6)] //虚线大小
        
        let path:CGMutablePath = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 10))
        path.addLine(to: CGPoint(x: lineView.frame.width, y: 10))
        shapeLayer.path = path
        
        lineView.layer.addSublayer(shapeLayer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
