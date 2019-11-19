//
//  ReviewOrderVC.swift
//  Limitee
//
//  Created by Apple on 16/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ReviewOrderVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var bagSubTotLbl: UILabel!
    
    @IBOutlet weak var subtotalLbl: UILabel!
    @IBOutlet weak var subTotRateLbl: UILabel!
    @IBOutlet weak var deliveryChargesLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    var bagListImg:Array = [UIImage]()
    var cartList :NSArray = []
    var resultDict :NSDictionary = [:]
    var resultDict1 :NSDictionary = [:]
    var mainDic :NSMutableDictionary!

    @IBOutlet weak var myBagTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        var dic:NSDictionary = [:]
        dic = ["customer_id":Settings.currentUserID(),"device_id":str_udid as! String,"is_guest":"1"]
        self.deliveryChargesLbl.text = String(format: "%@ %@",mainDic.value(forKey: "delivery_charges") as! String,Localization.get("KD"))

        self.makeCall(Page.view_cart , params: dic as! [String : AnyObject] , completionHandler: { (response) in
            self.resultDict = response as! NSDictionary
            self.resultDict1 = self.resultDict.value(forKey: "results") as! NSDictionary
            self.cartList = self.resultDict1.value(forKey: "cart_items") as! NSArray
            print (self.cartList)
            self.subtotalLbl.text = String(format: "%@ %@", self.resultDict1.value(forKey: "bag_total") as! String,Localization.get("KD"))

            self.totalLbl.text = String(format: "%.3f %@", Float(self.resultDict1.value(forKey: "bag_total") as! String)!+Float(self.mainDic.value(forKey: "delivery_charges") as! String)!,Localization.get("KD"))
            self.loadDetails()
            self.myBagTV.reloadData()
            
                         })
    }
    func loadDetails(){
        mainDic.setValue(resultDict1.value(forKey: "bag_total") as! String, forKey: "sub_total")
        mainDic.setValue(Float(self.resultDict1.value(forKey: "bag_total") as! String)!+Float(self.mainDic.value(forKey: "delivery_charges") as! String)!, forKey: "grand_total")
        mainDic.setValue(Settings.currentUserID(), forKey: "customer_id")
        mainDic.setValue("T", forKey: "order_from")
        mainDic.setValue("T", forKey: "address_title")
        mainDic.setValue("T", forKey: "latitude")
        mainDic.setValue("T", forKey: "longitude")

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

                       return cell
                   
               }

               func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return UITableView.automaticDimension
               }

               func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               }

    @IBAction func checkOutBtnAction(_ sender: UIButton) {
print(mainDic)
        self.makeCall(Page.order_placing , params: mainDic as! [String : AnyObject] , completionHandler: { (response) in
        print(response)
        
                     })
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
