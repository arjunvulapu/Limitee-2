//
//  BrandsVC.swift
//  Limitee
//
//  Created by Apple on 04/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SDWebImage

class ShoppingCartVC: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource  {
    @IBOutlet weak var brandsCollectionView: UICollectionView!
    var ProdictsList:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "Group 5"), style: .plain, target: self, action: #selector(dotsBarBtnAction))
        let dotsRightBarBtn = UIBarButtonItem(image: UIImage(named: "Group 61"), style: .plain, target: self, action: #selector(dotsBarBtnAction))
        
        let cartRightBarBtn = UIBarButtonItem(image: UIImage(named: "Group 60"), style: .plain, target: self, action: #selector(dotsBarBtnAction))
        
                let bluetoothBtn = UIBarButtonItem(image: UIImage(named: "003-magnifying-glass"), style: .plain, target: self, action: #selector(bluetoothBarBtnAction))
        
        
        
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
                imageView.contentMode = .scaleAspectFit
                let image = UIImage(named: "Group 6")
                imageView.image = image
                self.navigationItem.titleView = imageView
        self.navigationItem.leftBarButtonItem = leftBarButton
        
                self.navigationItem.rightBarButtonItems = [bluetoothBtn,cartRightBarBtn,dotsRightBarBtn]
        
        
        
        
        
        brandsCollectionView.delegate = self
       brandsCollectionView.dataSource = self
     let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: brandsCollectionView.frame.size.width/2, height: 180)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .vertical
        brandsCollectionView.collectionViewLayout = flowLayout
    }
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    override func viewWillAppear(_ animated: Bool) {
            // Do any additional setup after loading the view.
            self.makeCall(Page.brandsList , params: [:] , completionHandler: { (response) in
                let ResultDict:NSDictionary = response as! NSDictionary
                print (ResultDict)
                
                self.ProdictsList = ResultDict.value(forKey: "results") as! NSArray
                  self.brandsCollectionView.layoutIfNeeded()

                    self.brandsCollectionView.reloadData()
                
            })
    }
    
    @objc func dotsBarBtnAction(){
        
    }
    @objc func bluetoothBarBtnAction(){
        
    }
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProdictsList.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandsCC", for: indexPath as IndexPath) as! BrandsCC
        cell.LblTop.isHidden  = true
        cell.sideLblLeft.isHidden  = true
        cell.sideLblRight.isHidden  = true
        cell.LblBottom.isHidden  = false
        if(indexPath.row % 2 == 0){
             cell.sideLblLeft.isHidden  = true
        }else{
                    cell.sideLblLeft.isHidden  = false

        }
        
        let projectInfo:NSDictionary = ProdictsList[indexPath.row] as! NSDictionary
        cell.brandTitle.text = String(format:"%@",projectInfo.value(forKey: "brand_name") as! String)

//
        if let imageURL = URL(string:projectInfo.value(forKey: "brand_image") as! String) {
            cell.brandImage.sd_setImage(with: imageURL)
        }
//        shadowToView(view: cell.shadowView)

        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                let VC:CategoriesVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
        let projectInfo:NSDictionary = ProdictsList[indexPath.row] as! NSDictionary

        VC.category_id = projectInfo.value(forKey: "brand_id") as! NSString
        VC.category_name = projectInfo.value(forKey: "brand_name") as! NSString
        self.navigationController?.pushViewController(VC, animated: true)

    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width:180, height: 180)
//    }
////    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
////        return CGSize(width: 150, height: 150)
////    }
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1.0;
//    }
}

