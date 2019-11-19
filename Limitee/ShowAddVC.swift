//
//  ShowAddVC.swift
//  Limitee
//
//  Created by Apple on 18/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ShowAddVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    @IBOutlet weak var addNewAddBtn: UIButton!
    @IBOutlet weak var showAddTV: UITableView!
    
    var resultDict:NSDictionary!
       var addAddressArray:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()

        addAddressArray = []
        self.navigationController?.navigationBar.isHidden = true

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "Group 6")
        imageView.image = image
        self.navigationItem.titleView = imageView
        
        let backItem = UIBarButtonItem()
        //           backItem.title = "Back"
                   navigationItem.backBarButtonItem = backItem
        //        self.navigationController?.navigationBar.barTintColor = UIColor.black
                self.navigationController?.navigationBar.tintColor = UIColor.black
        
        
       var dic:NSDictionary = [:]
                           dic = ["task":"AddAddress","lang":"en"]
        self.makeCall(Page.manageAddress , params: dic as! [String : AnyObject] , completionHandler: { (response) in
        self.resultDict = response as! NSDictionary
        //                     self.ordersArray = self.resultDict.value(forKey: "customer_id") as! NSArray
        //                     print (self.ordersArray)
                             self.showAddTV.reloadData()
                             
                                          })
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addBtnAction(_ sender: UIButton) {
       
        
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return addAddressArray.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = showAddTV.dequeueReusableCell(withIdentifier: "ShowAddTC", for: indexPath) as! ShowAddTC
        let iteminfo:NSDictionary = addAddressArray.object(at: indexPath.row) as! NSDictionary

            
        cell.addTV.text = iteminfo.value(forKey: "product_name") as! String
//                     cell.rateLbl.text = String(format: "%@ %@", iteminfo.value(forKey: "price") as!
//                         String,Localization.get("KD"))
        Localization.get("en")
          //                       cell.numLbl.text = iteminfo.value(forKey: "quantity") as! String

                                        return cell
      }
    
}
