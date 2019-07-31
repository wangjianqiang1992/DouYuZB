//
//  PageContentView.swift
//  DYZB
//
//  Created by qiangzi on 2019/7/31.
//  Copyright © 2019年 WJQ. All rights reserved.
//

import UIKit

private let cellViewID = "cellViewID"

class PageContentView: UIView {

    
    private var childVcs : [UIViewController] = []
    
    private var superViewController : UIViewController = UIViewController()
    
    
//  懒加载 UICollectionView
    
    private lazy var conllectionView : UICollectionView = {
        //创建layout
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = self.bounds.size
        
        layout.minimumLineSpacing = 0
        
        layout.minimumInteritemSpacing = 0
        
        layout.scrollDirection = .horizontal
        
        
        //创建conllectionView
        
        let conllectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        conllectionView.showsHorizontalScrollIndicator = false
        
        conllectionView.isPagingEnabled = true
        
        conllectionView.bounces = false
        
        conllectionView.dataSource = self
        
       // conllectionView.register(UICollectionView.self, forCellWithReuseIdentifier: cellID)
        
        conllectionView.register(UICollectionView.self, forCellWithReuseIdentifier: cellViewID)
        return conllectionView
        
        
        
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience  init(frame: CGRect,childVcs: [UIViewController],superViewController: UIViewController) {
        
        self.init(frame: frame)
        
        self.childVcs = childVcs
        
        self.superViewController = superViewController
        
        setUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension PageContentView{
    
    private func setUI(){
        
        for childVC in childVcs {
            
            superViewController.addChild(childVC)
            
        }
        
        addSubview(conllectionView)
        conllectionView.frame = bounds
    }
    
    
}



//遵守 UICollectionViewDataSource  协议
extension PageContentView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = conllectionView.dequeueReusableCell(withReuseIdentifier: cellViewID, for: indexPath)
       
        
        //cell 设置内容
        
        for view in cell.contentView.subviews{
            
            
            view.removeFromSuperview()
            
        }
        
        
        
        
        let childVC = childVcs[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        
        cell.contentView.addSubview(childVC.view)
        
        
        return cell
    }
    
    
}
