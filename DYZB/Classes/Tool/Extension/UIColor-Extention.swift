//
//  UIColor-Extention.swift
//  DYZB
//
//  Created by qiangzi on 2019/7/31.
//  Copyright © 2019年 WJQ. All rights reserved.
//

import UIKit

extension UIColor{
    
   convenience init(r:CGFloat,g:CGFloat,b:CGFloat){
        
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
        
    }
    
}
