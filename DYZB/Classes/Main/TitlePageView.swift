//
//  TitlePageView.swift
//  DYZB
//
//  Created by qiangzi on 2019/7/31.
//  Copyright © 2019年 WJQ. All rights reserved.
//

import UIKit

private var scrolllineH : CGFloat = 2

class TitlePageView: UIView {

    
    //定义属性
    private var titles : [String] = []
    
    //懒加载数组
    private lazy var lables : [UILabel] = [UILabel]()
    
    //懒加载属性
    
    private lazy var scrollView : UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces  = false
        
        //scrollView.backgroundColor = UIColor.purple
        
        return scrollView
        
    }()
    
    
    private lazy var scrolLine : UIView = {
        
        let scrolLine = UIView()
        
        scrolLine.backgroundColor = UIColor.orange
        
        return scrolLine
    }()
    
    
    
   //自定义构造函数
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience  init(frame: CGRect, titles:[String]) {
        
        self.init(frame: frame)
        
         self.titles = titles;
        //创建UI
          setUI()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}




//设置UI界面

extension TitlePageView{
    
    //创建ScrolView
    
    private func setUI(){
        
        
        
        scrollView.frame = bounds
        setTitleLables()
        
        setBottomLineAndScrolLine()
        addSubview(scrollView)
        
        
    }
    
    
    private func setTitleLables(){
        
        let lableW : CGFloat = frame.width/CGFloat(titles.count)
        
        let lableH : CGFloat = frame.height - scrolllineH
        let lableY : CGFloat = 0
        
        for (index,title) in titles.enumerated() {
            let lable = UILabel()
            
            lable.text = title
            
            lable.tag = index
            
            lable.textColor = UIColor.lightGray
            
            lable.textAlignment = .center
            
            lable.font = UIFont.systemFont(ofSize: 16.0)
            
            
            
            let lableX : CGFloat = lableW * CGFloat(index)
            
            lable.frame = CGRect(x: lableX, y: lableY, width: lableW, height: lableH)
            
            
            scrollView.addSubview(lable)
            
            lables.append(lable)
        }
        
        
        
    }
    
    private func setBottomLineAndScrolLine(){
        
        let bottomLine = UIView()
        
        bottomLine.backgroundColor = UIColor.lightGray
        
        bottomLine.frame = CGRect(x: 0, y: frame.height-scrolllineH, width: frame.width, height: scrolllineH)
        
        addSubview(bottomLine)
        
        
        scrollView.addSubview(scrolLine)
        
        guard let lable = lables.first else {
            return
        }
        lable.textColor = UIColor.orange
        
        scrolLine.frame = CGRect(x: lable.frame.origin.x, y: frame.height-scrolllineH, width: lable.frame.size.width, height: scrolllineH)
        
    }
    
    
    
    
    
}
