//
//  CategoriesVC.swift
//  Limitee
//
//  Created by Apple on 13/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CategoriesVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    
    @IBOutlet weak var exclusiveLbl: UILabel!
    @IBOutlet weak var exclusiveTableView: UITableView!
    var category_id:NSString!
    var category_name:NSString!
    var type:NSString!

    @IBOutlet weak var catNameLbl: UILabel!
    
    
  
  
    var resultDict:NSDictionary!

    var exclusiveArray:NSArray!
    var exclusiveNames:Array = [String]()
       var exclusiveImg:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        exclusiveArray = []
        catNameLbl.text = category_name as String?
        exclusiveImg = [#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129")]
//              leftBarBtn.target = revealViewController()
//                             leftBarBtn.action = #selector(SWRevealViewController.revealToggle(_:))
//                             self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                        let leftBarButton = UIBarButtonItem(image: UIImage(named: "Group 5"), style: .plain, target: self, action: #selector(leftBarBtnAction))
                
                let dotsRightBarBtn = UIBarButtonItem(image: UIImage(named: "Group 61"), style: .plain, target: self, action: #selector(dotsBarBtnAction))
        
        let cartRightBarBtn = UIBarButtonItem(image: UIImage(named: "Group 60"), style: .plain, target: self, action: #selector(dotsBarBtnAction))
        
                let bluetoothBtn = UIBarButtonItem(image: UIImage(named: "003-magnifying-glass"), style: .plain, target: self, action: #selector(bluetoothBarBtnAction))
        
        
        
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
                imageView.contentMode = .scaleAspectFit
                let image = UIImage(named: "Group 6")
                imageView.image = image
                self.navigationItem.titleView = imageView
                self.navigationItem.leftBarButtonItem = leftBarButton
                self.navigationItem.rightBarButtonItems = [bluetoothBtn,cartRightBarBtn,dotsRightBarBtn]
        
      
//        UINavigationBar.appearance().barTintColor = UIColor.black
        var dic:NSDictionary = [:]
        if(type == "brand"){
         dic = ["brand_id":category_id]
        }else{
            dic = ["category_id":category_id]

        }

        self.makeCall(Page.all_products , params: dic as! [String : AnyObject] , completionHandler: { (response) in
            self.resultDict = response as! NSDictionary
            self.exclusiveArray = self.resultDict.value(forKey: "results") as! NSArray
            print (self.exclusiveArray)
            self.exclusiveTableView.reloadData()
                         })
    }
    
    @IBAction func filterOneAction(_ sender: UIButton) {
        
    }
    
    @IBAction func filterTwoAction(_ sender: UIButton) {
        
    }
    
    
    @IBAction func cartBtnAction(_ sender: UIButton) {
        
    }
    
    
    @IBAction func favoriteBtnAction(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func leftBarBtnAction(_ sender: UIBarButtonItem) {
        
        
    }
    
    
    @objc func dotsBarBtnAction(){
        
    }
    @objc func bluetoothBarBtnAction(){
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return exclusiveArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTC", for: indexPath) as! CategoriesTC
        let info:NSDictionary = exclusiveArray![indexPath.row] as! NSDictionary
        if let imageURL = URL(string:info.value(forKey: "product_image") as! String) {
            cell.pImage.sd_setImage(with: imageURL)
            }
        cell.pnameLbl.text = info.value(forKey: "product_name") as! String
        cell.priceLbl.text = String(format: "%@ %@", info.value(forKey: "price") as! String,Localization.get("KD"))


            return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
