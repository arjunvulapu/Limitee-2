//
//  MyOrdersVC.swift
//  Limitee
//
//  Created by Apple on 18/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MyOrdersVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var myOrdersLbl: UILabel!
    
    
    @IBOutlet weak var myOrdersTV: UITableView!
    
    var order_id:NSString!
    var brand_name:NSString!
    var type:NSString!
    var rate:NSString!
    var statusList:NSString!
    
    var resultDict:NSDictionary!
    var ordersArray:NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

         let backItem = UIBarButtonItem()
        //           backItem.title = "Back"
                   navigationItem.backBarButtonItem = backItem
        //        self.navigationController?.navigationBar.barTintColor = UIColor.black
                self.navigationController?.navigationBar.tintColor = UIColor.black
        
            ordersArray = []
        var dic:NSDictionary = [:]
                   dic = ["customer_id":Settings.currentUserID()]
                 self.makeCall(Page.myOrders , params: dic as! [String : AnyObject] , completionHandler: { (response) in
                     self.resultDict = response as! NSDictionary
                    self.ordersArray = self.resultDict.value(forKey: "results") as! NSArray
//                     self.ordersArray = self.resultDict.value(forKey: "customer_id") as! NSArray
//                     print (self.ordersArray)
                     self.myOrdersTV.reloadData()
                     
                                  })
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        cell
        return ordersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myOrdersTV.dequeueReusableCell(withIdentifier: "MyOrdersTC", for: indexPath) as! MyOrdersTC
                       let iteminfo:NSDictionary = ordersArray.object(at: indexPath.row) as! NSDictionary

           if let imageURL = URL(string:iteminfo.value(forKey: "product_image") as! String) {
               cell.myOrderImgs.sd_setImage(with: imageURL)
               }
           cell.orderIdLbl.text = String(format: "Order ID: %@", iteminfo.value(forKey: "order_id") as! String)
        cell.orderIdShowLbl.text = ""
           cell.rateLbl.text = String(format: "%@ %@",Localization.get("KD"), iteminfo.value(forKey: "grand_total") as! String)
        cell.statusLbl.text = String(format: "Status:%@", iteminfo.value(forKey: "order_status") as! String)
        cell.dateLbl.text = String(format: "%@", iteminfo.value(forKey: "order_date") as! String)

//                       cell.numLbl.text = iteminfo.value(forKey: "quantity") as! String

                              return cell
                          
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC:OrderDetailsVC = self.storyboard?.instantiateViewController(identifier: "OrderDetailsVC") as! OrderDetailsVC
                   self.navigationController?.pushViewController(VC, animated: true)
    }
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
