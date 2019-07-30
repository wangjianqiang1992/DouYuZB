//
//  MainTabbarController.swift
//  DYZB
//
//  Created by qiangzi on 2019/7/31.
//  Copyright © 2019年 WJQ. All rights reserved.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let classArray = ["Home","Live","Follow","Personal"]
        
        
       addChlidVC(storyBoardNameArray: classArray)
        
        
        
        
       
        
        // Do any additional setup after loading the view.
    }

    
    private func addChlidVC(storyBoardNameArray:Array<Any>){
        
        
        for className in storyBoardNameArray {
            
            let childVC = UIStoryboard(name: className as! String, bundle: nil).instantiateInitialViewController()!
            
            addChild(childVC)
            
        }
        
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
