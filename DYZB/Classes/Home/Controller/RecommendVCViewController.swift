//
//  RecommendVCViewController.swift
//  DYZB
//
//  Created by qiangzi on 2019/8/1.
//  Copyright © 2019年 WJQ. All rights reserved.
//

import UIKit

private let kGapW :CGFloat = 10

private let kItemW : CGFloat = (ScreenWidth - 3*10)/2

private let kNormalItemH :CGFloat = kItemW * 3 / 4

private let kPrettyItemH :CGFloat = kItemW * 4 / 3



private let kNormalCellID =  "kNormalCellID"

private let kPrettyCellID = "kPrettyCellID"


private let kHeaderCellID = "kHeaderCellID"

private let klayOutHeadH :CGFloat = 50



class RecommendVCViewController: UIViewController {

    
    
    
    private lazy var conllectionView : UICollectionView = {
        
        let layOut = UICollectionViewFlowLayout()
        
        layOut.itemSize = CGSize(width: kItemW, height: kNormalItemH)
        
        layOut.minimumLineSpacing = 0
        
        layOut.minimumInteritemSpacing = kGapW
        
        layOut.headerReferenceSize = CGSize(width: ScreenWidth, height: klayOutHeadH)
        
        layOut.sectionInset = UIEdgeInsets(top: 0, left: kGapW, bottom: 0, right: kGapW)
        
        
        let conllectionView = UICollectionView(frame:self.view.bounds , collectionViewLayout: layOut)
        
        conllectionView.showsHorizontalScrollIndicator = false
        
        conllectionView.isPagingEnabled = true

        conllectionView.bounces = false
        
        
     
        
        conllectionView.register(UINib(nibName: "NomalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        
        conllectionView.register(UINib(nibName: "PrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        
    
        
        conllectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kHeaderCellID)
        
        conllectionView.backgroundColor = UIColor.white
        
        //随着父控件拉伸儿拉伸
        conllectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        conllectionView.delegate = self
        
        conllectionView.dataSource = self
        
        return conllectionView
        
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
        //设置UI界面
        setUI()
    }
    

   
}

//设置UI界面
extension RecommendVCViewController{
    
    
    private func setUI(){
        
        
        view.addSubview(conllectionView)
        
        
    }
    
}



//遵守conllectionViewdataSource协议

extension RecommendVCViewController : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
       return 12
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section==0 {
          return  8
        }
        
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if indexPath.section == 1 {
          
            cell = conllectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath)
        }else{
            
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
            
        }
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let headerView = conllectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderCellID, for: indexPath)
        
        //headerView.backgroundColor = UIColor.purple
        
        
        return headerView
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        if indexPath.section == 1 {
            return CGSize(width: kItemW, height: kPrettyItemH)
        }else{
            
             return CGSize(width: kItemW, height: kNormalItemH)
            
        }
        
        
        
    }
    
}
