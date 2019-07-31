//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by qiangzi on 2019/7/31.
//  Copyright © 2019年 WJQ. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
   /*
    class func createUIBarButtonItem(imageName:String,highLightImage:String,size:CGSize) ->UIBarButtonItem{
        
        let button = UIButton(type: .custom)
        
        button.setImage(UIImage.init(named: imageName), for: .normal)
        
        button.setImage(UIImage.init(named: highLightImage), for: .highlighted)
        
        button.frame = CGRect(origin: .zero, size: size)
        
        
        return UIBarButtonItem.init(customView: button)
        
    }
    */
    
    //便利构造函数必须满足两点  1->convenience开头 2-> 在构造函数中必须调用一个设计的构造函数（self）
    convenience init(imageName:String,highLightImage:String = "",size:CGSize = CGSize.zero){
        
        let button = UIButton(type: .custom)
        
        button.setImage(UIImage.init(named: imageName), for: .normal)
        
        if highLightImage != "" {
             button.setImage(UIImage.init(named: highLightImage), for: .highlighted)
        }
        
        if size == CGSize.zero {
            button.sizeToFit()
        }else{
             button.frame = CGRect(origin: .zero, size: size)
            
        }
       
        
       
        
        self.init(customView: button)
        
    }
    
    
}
