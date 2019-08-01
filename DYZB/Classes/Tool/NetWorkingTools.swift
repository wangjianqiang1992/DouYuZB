//
//  NetWorkingTools.swift
//  AlamofireTest
//
//  Created by qiangzi on 2019/8/1.
//  Copyright © 2019年 WJQ. All rights reserved.
//

import UIKit

import Alamofire

// 请求方式枚举
enum MethodType {
    
    case GET
    
    case POST
}

class NetWorkingTools {
    
    
    
    
    
    class func requset(type : MethodType, URLString : String, parameters : [String : NSObject]? = nil, finishedCallball : @escaping (_ result : AnyObject) -> ()){
        
        
        let method = type == .GET ? HTTPMethod.get:HTTPMethod.post
        
        
        Alamofire.request(URLString, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            guard let result  = response.result.value else{
                
                print("错误信息是 \(String(describing: response.result.error))")
                
                return
                
            }
            
            
            finishedCallball(result as AnyObject)
            
        }
    }
    
    
    
    
    class func requestGetMethod(type : MethodType,URLString:String,parameters : [String:NSObject]?=nil,finishedCallback : @escaping (_ result : NSDictionary) -> ()){
        
       
        
        let method = type == .GET ? HTTPMethod.get:HTTPMethod.post
        
        
        Alamofire.request(URLString, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            guard let result = response.result.value else{
                
                print("错误信息是 \(String(describing: response.result.error))")
                
                return
                
            }
            
            
            finishedCallback(result as! NSDictionary)
            
        }
        
        
        
    }

}
