//
//  HomeViewController.swift
//  DYZB
//
//  Created by qiangzi on 2019/7/31.
//  Copyright © 2019年 WJQ. All rights reserved.
//

import UIKit

private let titleViewH : CGFloat = 40

class HomeViewController: UIViewController {

    //懒加载TitlePageView
    
    private lazy var titlePageView : TitlePageView = {
       
        let frame = CGRect(x: 0, y: kStatusBarH+kNavigationBar, width: ScreenWidth, height: titleViewH)
        
        let titles = ["推荐","游戏","娱乐","趣玩"]
        
        
        let titleView = TitlePageView(frame: frame, titles: titles)
        
         titleView.delegate = self
        
        //titleView.backgroundColor = UIColor.red
        
        return titleView
        
    }()
    
    
    private lazy var pageContentView : PageContentView = {[weak self] in
        
        let pageX : CGFloat = 0
        let pageY : CGFloat = titlePageView.frame.maxY
        let pageW : CGFloat = ScreenWidth
        let pageH : CGFloat = ScreenHeight - kNavigationBar - kStatusBarH - kTabbarH - titlePageView.frame.size.height
        
       
        var childVcs = [UIViewController]()
        
        for _ in 0..<4{
            
            let childVC = UIViewController()
            
            childVC.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(UInt32(255.0))), g: CGFloat(arc4random_uniform(UInt32(255.0))), b: CGFloat(arc4random_uniform(UInt32(255.0))))
            
            childVcs.append(childVC)
        }
        
        
    
        
        
        let pageContentView = PageContentView(frame: CGRect(x: 0, y:pageY , width: ScreenWidth, height: pageH), childVcs: childVcs, superViewController: self)
        
        
        return pageContentView
        
        
        
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      //设置UI界面
     setHomeUI()
        
        //设置titleView
        
        view.addSubview(titlePageView)
        
        view.addSubview(pageContentView)
        
        pageContentView.backgroundColor = UIColor.red
        
       
        
    }
    
}
    
//设置UI界面
extension HomeViewController {
    
    private func setHomeUI() {
        
        setNavigationUI()
        
        
    }
    
    private func setNavigationUI() {
        
        let bt = UIButton(type: .custom)
        
        bt.setImage(UIImage.init(named: "homeLogoIcon"), for: .normal)
        
        bt.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: bt)
        
        
        let leftBt = UIBarButtonItem(imageName: "homeLogoIcon", highLightImage: "", size: CGSize.zero)
        
        navigationItem.leftBarButtonItem = leftBt
        
        let size = CGSize(width: 40, height: 40)
        
      
        
        
        
        let naviBt1 = UIBarButtonItem(imageName: "btn_home_normal", highLightImage: "card_rank_hori_live", size: size)
       
        
        let naviBt2 = UIBarButtonItem(imageName: "btn_home_normal", highLightImage: "card_rank_hori_live", size: size)
        
        let naviBt3 = UIBarButtonItem(imageName: "btn_home_normal", highLightImage: "card_rank_hori_live", size: size)
        
//        let naviBt1 = UIBarButtonItem.createUIBarButtonItem(imageName: "btn_home_normal", highLightImage: "card_rank_hori_live", size: size)
//
//         let naviBt2 = UIBarButtonItem.createUIBarButtonItem(imageName: "btn_home_normal", highLightImage: "card_rank_hori_live", size: size)
//         let naviBt3 = UIBarButtonItem.createUIBarButtonItem(imageName: "btn_home_normal", highLightImage: "card_rank_hori_live", size: size)
        
        navigationItem.rightBarButtonItems = [naviBt1,naviBt2,naviBt3]
        
        
        
    }
  
}


extension HomeViewController : TitlePageViewDelegate{
    
    
    @objc func titlePageView(titleView: TitlePageView, selectedIndex index: Int) {
        
        print("我点了第\(index+1)个Lable")
       
        
        pageContentView.jupmIndexPageView(currentIndex: index)
        
        
    }
    
    
}
