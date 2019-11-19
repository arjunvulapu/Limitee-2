//
//  WishListVC.swift
//  Limitee
//
//  Created by Apple on 15/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class WishListVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var wishList:NSArray = []
    var resultDict :NSDictionary = [:]

    @IBOutlet weak var wishListTV: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()
   self.navigationController?.navigationBar.isHidden = true
          var dic:NSDictionary = [:]
            dic = ["customer_id":Settings.currentUserID()]
          self.makeCall(Page.my_favorites , params: dic as! [String : AnyObject] , completionHandler: { (response) in
              self.resultDict = response as! NSDictionary
              self.wishList = self.resultDict.value(forKey: "results") as! NSArray
              print (self.wishList)
              self.wishListTV.reloadData()
              
                           })
        }
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                
                return wishList.count
            }

            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    
                    let cell = wishListTV.dequeueReusableCell(withIdentifier: "WishListTC", for: indexPath) as! WishListTC
   let iteminfo:NSDictionary = wishList.object(at: indexPath.row) as! NSDictionary

      if let imageURL = URL(string:iteminfo.value(forKey: "product_image") as! String) {
          cell.wishListImgs.sd_setImage(with: imageURL)
          }
      cell.productLbl.text = iteminfo.value(forKey: "product_name") as! String
      cell.rateLbl.text = String(format: "%@ %@", iteminfo.value(forKey: "price") as!
          String,Localization.get("KD"))
                    return cell
                
            }

            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return UITableView.automaticDimension
            }

            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            }
        @IBAction func backBtnAction(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
        }

}
