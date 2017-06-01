//
//  SystemConfig.swift
//  uxuanjia
//
//  Created by JHnoplan on 17/5/26.
//  Copyright © 2017年 JHnoplan. All rights reserved.
//

import UIKit

// 屏幕的宽
let SCREEN_W = UIScreen.main.bounds.size.width
// 屏幕的高
let SCREEN_H = UIScreen.main.bounds.size.height

//配置3原色
func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
    return UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
}

///导航高度
public let NAV_HEIGHT : CGFloat = 64.0
///工具栏高度
public let TOOLBAR_HEIGHT : CGFloat = 49.0
///log输出
public func printLog<T>(_ items:T ,file:String = #file,method: String = #function,line: Int = #line){
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)],\(method):\n\(items)\n--------------------------------------")
    #endif
}

//最大、最小长度
public let SCREEN_MAX_LENGTH = max(SCREEN_W, SCREEN_H)
public let SCREEN_MIN_LENGTH = min(SCREEN_W, SCREEN_H)

/**
 *  设备类型
 */
public enum DeveiceType : Int{
    case iPad
    case iPhone
    case retina
    case unknown
}

/**
 *  手机型号
 */
public enum iPhoneType : Int{
    case iPhone4Series
    case iPhone5Series
    case iPhoneCommenSeries //包括6，6s，7
    case iPhonePlusSeries//包括6p，6sp,7p
    case unknowSeries
}

/**
 *  判断设备类型
 */
public func deveiceType() -> DeveiceType {
    if UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiom.pad {
        return DeveiceType.iPad
    }else if UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiom.phone {
        return DeveiceType.iPhone
    }else if UIScreen.main.scale >= 2.0 {
        return DeveiceType.retina
    }else{
        return DeveiceType.unknown
    }
}

/**
 *  判断手机类型
 */
public func PhoneType() -> iPhoneType{
    if deveiceType()==DeveiceType.iPhone {
        if  SCREEN_MAX_LENGTH<568.0 {
            return iPhoneType.iPhone4Series
        }else if  SCREEN_MAX_LENGTH==568.0 {
            return iPhoneType.iPhone5Series
        }else if  SCREEN_MAX_LENGTH==667.0 {
            return iPhoneType.iPhoneCommenSeries
        }else if  SCREEN_MAX_LENGTH==736.0 {
            return iPhoneType.iPhonePlusSeries
        }else{
            return iPhoneType.unknowSeries
        }
    }else {
        return iPhoneType.unknowSeries
    }
}

/**
 *  画圆角（自定义线宽）
 */
public func drawBorder(_ view:UIView,_ color:UIColor,_ width:CGFloat,_ radiuce:CGFloat){
    view.layer.borderColor=color.cgColor
    view.layer.borderWidth=width
    view.layer.cornerRadius=radiuce
    view.layer.masksToBounds=true
}

/**
 *  转json字符串
 */
public func changeToJsonDicString(_ jsonDict:Dictionary<String, Any>) -> String? {
    var jsonStr : String?
    do {
        let jsonData:Data = try JSONSerialization.data(withJSONObject: jsonDict, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonString = String(data: jsonData, encoding: String.Encoding.utf8)
        jsonStr=jsonString!
    } catch {
        printLog(error)
    }
    return jsonStr
}

/**
 *  格式化后的时间 ：时间格式 “yyyy-MM-dd HH:mm” 单位s
 */
public func getTimeDate(_ time:TimeInterval ,_ timeformat:String) -> String {
    let date = Date(timeIntervalSince1970: time/1000)
    let formatter = DateFormatter()
    formatter.dateFormat=timeformat
    let strTime = formatter.string(from: date)
    return strTime
}

/**
 *  获取当前时间：时间格式 “yyyy-MM-dd HH:mm” 单位s
 */
public func getCurrentTime(_ timeformat:String) -> String {
    let currentTime = Date().timeIntervalSince1970
    return getTimeDate(currentTime, timeformat)
}

/**
 *  设置字体大小
 */
public func getFont(_ fontSize:CGFloat) -> UIFont{
    return UIFont.systemFont(ofSize: fontSize)
}

/**
 *  判断手机号
 */
public func isMobileNumber(_ mobileNum:String) -> Bool {
    let mobile = "^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$"
    let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)"
    let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)"
    let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)"
    let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
    let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
    let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
    let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
    if ((regextestmobile.evaluate(with: mobileNum) == true)
        || (regextestcm.evaluate(with: mobileNum)  == true)
        || (regextestct.evaluate(with: mobileNum) == true)
        || (regextestcu.evaluate(with: mobileNum) == true))
    {
        return true
    }
    else
    {
        return false
    }
}

/**
 *  原生打电话
 */
public func callNumber(_ number:String) {
    let numberUrl = URL(string: "tel://"+number)
    UIApplication.shared.openURL(numberUrl!)
}





