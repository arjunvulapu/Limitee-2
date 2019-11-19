//
//  ExclusiveVC.swift
//  Limitee
//
//  Created by Apple on 13/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ExclusiveVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    
    @IBOutlet weak var exclusiveLbl: UILabel!
    @IBOutlet weak var exclusiveTableView: UITableView!
    
    
    
  
  
    var resultDict:NSDictionary!

    var exclusiveArray:NSArray!
    var exclusiveNames:Array = [String]()
       var exclusiveImg:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        exclusiveArray = []
        exclusiveImg = [#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129"),#imageLiteral(resourceName: "Group 7129")]

//        UINavigationBar.appearance().barTintColor = UIColor.black
         self.makeCall(Page.exclusive_products , params: [:] , completionHandler: { (response) in
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
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExclusiveCell", for: indexPath) as! ExclusiveCell
        let info:NSDictionary = exclusiveArray![indexPath.row] as! NSDictionary
        if let imageURL = URL(string:info.value(forKey: "product_image") as! String) {
            cell.exclusiveImgs.sd_setImage(with: imageURL)
            }
        cell.productNameLbl.text = info.value(forKey: "product_name") as! String
        cell.brandLbl.text = info.value(forKey: "brand_name") as! String
        cell.rateLbl.text = String(format: "%@ %@", info.value(forKey: "price") as! String,Localization.get("KD"))


            return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

}
