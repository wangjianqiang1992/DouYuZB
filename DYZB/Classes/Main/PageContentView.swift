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
    
    private weak var superViewController : UIViewController?
    
    
//  懒加载 UICollectionVie
    
    private lazy var conllectionView : UICollectionView = {[weak self] in
        //创建layout
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = (self?.bounds.size)!
        
        layout.minimumLineSpacing = 0
        
        layout.minimumInteritemSpacing = 0
        
        layout.scrollDirection = .horizontal
        
        
        //创建conllectionView
        
        let conllectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        conllectionView.showsHorizontalScrollIndicator = false
        
        conllectionView.isPagingEnabled = true
        
        conllectionView.bounces = false
        
        collectionView.delegate = self
        
        conllectionView.dataSource = self
        
        
        
        
        conllectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellViewID")
        return conllectionView
        
        
    }()
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience  init(frame: CGRect,childVcs: [UIViewController],superViewController: UIViewController?) {
        
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
            
            superViewController?.addChild(childVC)
            
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = conllectionView.dequeueReusableCell(withReuseIdentifier: "cellViewID", for: indexPath)
       
        
        //cell 设置内容
        
        for view in cell.contentView.subviews{
            
            
            view.removeFromSuperview()
            
        }
        
        let childVC = childVcs[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        
        cell.contentView.addSubview(childVC.view)
        
        
        return cell
    }
    
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("------")
//    }
//
}



extension PageContentView : UICollectionViewDelegate{
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print("------")
        
    }

}





extension PageContentView{
    
    
    func jupmIndexPageView(currentIndex : Int){
        
        
        let offSet = CGFloat(currentIndex) * ScreenWidth
        
        conllectionView.setContentOffset(CGPoint(x: offSet, y: 0), animated: false)
        
    }
    
}
