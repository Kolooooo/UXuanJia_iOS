//
//  UXJRequest.swift
//  uxuanjia
//
//  Created by Ken on 2017/6/2.
//
//

import UIKit
import AFNetworking


enum HTTPTpye: String {
    case POST = "POST"
    case GET = "GET"
    case HEAD = "HEAD" // 获取响应头, 断点续传
}

/// 网络管理工具
class UXJRequest: AFHTTPSessionManager {
    
    /// 网络请求类 -- 单例
    static let shareInstance: UXJRequest = {
        let url = URL(string: "https://m.uxuanjia.cn/")
        let client = UXJRequest(baseURL: url)
        /// 设置了请求的contentType
        client.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return client
    }()
    
    // pass@word1
    
    /// 网络请求 - 没有进度版本
    ///
    /// - Parameters:
    ///   - type: 请求类型
    ///   - URLString: 请求URL
    ///   - parameters: 请求参数
    ///   - success: 请求成功的回调
    ///   - failure: 请求失败的回调
    func request(type: HTTPTpye,URLString: String, parameters: Any?, success: ((URLSessionDataTask, Any?) -> Void)?, failure: ((URLSessionDataTask?, Error) -> Void)? = nil) {
        
        request(type: type, LongURLString: URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        
    }
    
    // MARK: - 内部方法
    /// 网络请求的实现方法
    ///
    /// - Parameters:
    ///   - type: 请求类型
    ///   - LongURLString: 请求URL
    ///   - parameters: 请求参数
    ///   - downloadProgress: 下载的进度的回调
    ///   - success: 请求成功的回调
    ///   - failure: 请求失败的回调
    func request(type: HTTPTpye,LongURLString: String, parameters: Any?, progress downloadProgress: ((Progress) -> Void)?, success: ((URLSessionDataTask, Any?) -> Void)?, failure: ((URLSessionDataTask?, Error) -> Void)? = nil){
        
        if type == .GET {
            // 发送get请求
            self.get(LongURLString, parameters: parameters, progress: downloadProgress, success: success, failure: failure)
        } else if type == .POST {
            
            // 发送post
            self.post(LongURLString, parameters: parameters, progress: downloadProgress, success: success, failure: failure)
        }
    }
    
    
    
    // 成功的方法和失败的方法只有一个参数
    func request(type: HTTPTpye,ShortURLString: String, parameters: Any?, success: (([String: Any]) -> Void)?, failure: (( Error) -> Void)? = nil) {
        
        // 网络请求成功之后的回调
        let successBlock = { (task: URLSessionDataTask,json: Any?) -> Void in
            
            guard let json = json as? [String: Any] else {
                return
            }
            
            success?(json)
        }
        
        // 失败的block
        let failureBlock = { (task: URLSessionDataTask?, error:Error) -> Void in
            failure?(error)
        }
        
        // 调用方法
        request(type: type, URLString: ShortURLString, parameters: parameters, success: successBlock, failure: failureBlock)
        
    }
    
    class func request(type: HTTPTpye, classURLString: String, parameters: Any?, success: (([String: Any]) -> Void)?, failure: (( Error) -> Void)? = nil) {
        
        
        UXJRequest.shareInstance.request(type: type, ShortURLString: classURLString, parameters: parameters, success: success, failure: failure)
        
    }
}

