//
//  DetailVC.swift
//  Limitee
//
//  Created by Apple on 15/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class DetailVC: BaseViewController {
    @IBOutlet weak var pImage: UIImageView!
    
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var likebtn: UIButton!
    @IBOutlet weak var ppriceLbl: UILabel!
    @IBOutlet weak var ptitle: UILabel!
    @IBOutlet weak var pdesTxtView: UITextView!
    @IBOutlet weak var addbagBtn: UIButton!
    var projectinfo:NSDictionary!
    override func viewDidLoad() {
        super.viewDidLoad()
       
     
                
               if let imageURL = URL(string:projectinfo.value(forKey: "product_image") as! String) {
                    pImage.sd_setImage(with: imageURL)
                          }
        ppriceLbl.text = String(format:"%@ %@",projectinfo.value(forKey: "price") as! String,Localization.get("KD"))
        ptitle.text = projectinfo.value(forKey: "product_name") as! String
        brandLbl.text = projectinfo.value(forKey: "brand_name") as! String
        pdesTxtView.text = projectinfo.value(forKey: "product_desc") as! String
        if(projectinfo.value(forKey: "favorite_status") as! Int == 0){
            likebtn.setImage(UIImage(named: "Group 7123"), for: .normal)
        }else{
            likebtn.setImage(UIImage(named: "Group 7124"), for: .normal)
        }
        self.tabBarController?.navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addtobagAction(_ sender: Any) {
        var dic:NSDictionary = [:]
        if(Settings.isUserLoggedIn()){
         dic = ["customer_id":Settings.currentUserID(),"device_id":str_udid as! String,"product_id":projectinfo.value(forKey: "product_id") as! String,"price":projectinfo.value(forKey: "price") as! String,"quantity":"1","offer_price":"0.000","is_guest":"0","is_offer_available":"0"]
        }else{
            dic = ["customer_id":"0","device_id":str_udid as! String,"product_id":projectinfo.value(forKey: "product_id") as! String,"price":projectinfo.value(forKey: "price") as! String,"quantity":"1","offer_price":"0.000","is_guest":"1","is_offer_available":"0"]

        }

         self.makeCall(Page.add_tocart , params: dic as! [String : AnyObject] , completionHandler: { (response) in
                        let ResultDict:NSDictionary = response as! NSDictionary
                        print (ResultDict)
                        
                    if(ResultDict.value(forKey: "status") as! Int == 0){
                        self.showErrorAlert(Localization.get(ResultDict.value(forKey: "message") as! String))
                    }else{
                        
                        self.showSuccessAlert(Localization.get(ResultDict.value(forKey: "message") as! String))

                    }

                    })
    }
    
    
    @objc func sidemenuBtnActon(){
           
           if self.revealViewController() != nil {
           self.revealViewController()?.revealToggle(animated:true)
           
           }
       }
       
       @objc func dotsBarBtnAction(){
              
          }
          @objc func bluetoothBarBtnAction(){
              
          }
    @IBAction func wishListbtn(_ sender: Any) {
        if(Settings.isUserLoggedIn()){
        var dic:NSDictionary = [:]
              
            dic = ["customer_id":Settings.currentUserID(),"product_id":projectinfo.value(forKey: "product_id") as! String]
              

               self.makeCall(Page.add_remove_favorites , params: dic as! [String : AnyObject] , completionHandler: { (response) in
                              let ResultDict:NSDictionary = response as! NSDictionary
                              print (ResultDict)
                              
                          if(ResultDict.value(forKey: "status") as! Int == 0){
                              self.showErrorAlert(Localization.get(ResultDict.value(forKey: "message") as! String))
                          }else{
                              
                              self.showSuccessAlert(Localization.get(ResultDict.value(forKey: "message") as! String))

                          }

                          })
    }
    }
}
