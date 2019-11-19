//
//  MyBagVC.swift
//  Limitee
//
//  Created by Apple on 16/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MyBagVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var bagSubTotLbl: UILabel!
    
    @IBOutlet weak var subTotRateLbl: UILabel!
    var bagListImg:Array = [UIImage]()
    var cartList :NSArray = []
    var resultDict :NSDictionary = [:]
    var resultDict1 :NSDictionary = [:]

    @IBOutlet weak var myBagTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        subTotRateLbl.text = ""
        self.navigationController?.navigationBar.isHidden = true
        var dic:NSDictionary = [:]
          dic = ["customer_id":Settings.currentUserID(),"device_id":str_udid as! String,"is_guest":"1"]
        self.makeCall(Page.view_cart , params: dic as! [String : AnyObject] , completionHandler: { (response) in
            self.resultDict = response as! NSDictionary
            if(self.resultDict.value(forKey: "status") as! Int == 0){
                self.showErrorAlert(Localization.get(self.resultDict.value(forKey: "message") as! String))
                }else{
            self.resultDict1 = self.resultDict.value(forKey: "results") as! NSDictionary
            self.cartList = self.resultDict1.value(forKey: "cart_items") as! NSArray
            print (self.resultDict)
            self.subTotRateLbl.text = String(format: "%@ %@", self.resultDict1.value(forKey: "bag_total") as!
            String,Localization.get("KD"))
            self.myBagTV.reloadData()
            }
            
                         })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                   
                   return cartList.count
               }

               func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                       
                       let cell = myBagTV.dequeueReusableCell(withIdentifier: "MyBagTC", for: indexPath) as! MyBagTC
                let iteminfo:NSDictionary = cartList.object(at: indexPath.row) as! NSDictionary

    if let imageURL = URL(string:iteminfo.value(forKey: "product_image") as! String) {
        cell.myBagImgs.sd_setImage(with: imageURL)
        }
    cell.prodNameLbl.text = iteminfo.value(forKey: "product_name") as! String
    cell.rateLbl.text = String(format: "%@ %@", iteminfo.value(forKey: "price") as!
        String,Localization.get("KD"))
                cell.numLbl.text = iteminfo.value(forKey: "quantity") as! String
                cell.deleteAction = {
                    var dic:NSDictionary = [:]
                    dic = ["cart_id":iteminfo.value(forKey: "cart_id"),"device_id":self.str_udid!,"cart_items_id":iteminfo.value(forKey: "cart_items_id")]

                    self.makeCall(Page.delete_cart_item , params: dic as! [String : AnyObject] , completionHandler: { (response) in
                    self.resultDict = response as! NSDictionary
                        print (self.resultDict)

                    self.resultDict1 = self.resultDict.value(forKey: "results") as! NSDictionary
                    self.cartList = self.resultDict1.value(forKey: "cart_items") as! NSArray
                    //print (self.cartList)
                    self.subTotRateLbl.text = String(format: "%@ %@", self.resultDict1.value(forKey: "bag_total") as!
                    String,Localization.get("KD"))
                    self.myBagTV.reloadData()
                    
                                 })
                }
                cell.favAction = {
                    var dic:NSDictionary = [:]
                    dic = ["cart_items_id":iteminfo.value(forKey: "cart_items_id")]
                    self.makeCall(Page.my_favorites , params: dic as! [String : AnyObject] , completionHandler: { (response) in
                    self.resultDict = response as! NSDictionary
                    self.resultDict1 = self.resultDict.value(forKey: "results") as! NSDictionary
                    self.cartList = self.resultDict1.value(forKey: "cart_items") as! NSArray
                    print (self.resultDict)
                    self.subTotRateLbl.text = String(format: "%@ %@", self.resultDict1.value(forKey: "bag_total") as!
                    String,Localization.get("KD"))
                    self.myBagTV.reloadData()
                    
                                 })
                }
                       return cell
                   
               }

               func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return UITableView.automaticDimension
               }

               func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               }

    @IBAction func checkOutBtnAction(_ sender: UIButton) {
        if(Settings.isUserLoggedIn()){
        let VC = self.storyboard?.instantiateViewController(identifier: "SaveAddVC")
        self.navigationController?.pushViewController(VC!, animated: true)
        }else{
            let VC:SignInVC = self.storyboard?.instantiateViewController(identifier: "SignInVC") as! SignInVC
            VC.cart_id = self.resultDict1.value(forKey: "cart_id") as! NSString
                self.navigationController?.pushViewController(VC, animated: true)
        }
        
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
