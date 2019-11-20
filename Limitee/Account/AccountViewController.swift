//
//  AccountViewController.swift
//  Limitee
//
//  Created by Apple on 13/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AccountViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource ,UITabBarDelegate{
   
    
    @IBOutlet weak var accountTableView: UITableView!
    var from:NSString!
    var menuNames = [String]()
    var menuImgs:Array = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if(Settings.isUserLoggedIn()){
            menuNames = [Localization.get("Order History"),Localization.get("Address Book"),Localization.get("My Wishlist"),Localization.get("About Us"),Localization.get("Terms & Conditions"),Localization.get("Logout")]
                       menuImgs = [#imageLiteral(resourceName: "001-history"),#imageLiteral(resourceName: "002-address-book-hand-drawn-outline"),#imageLiteral(resourceName: "love"),#imageLiteral(resourceName: "003-info"),#imageLiteral(resourceName: "T&C"),#imageLiteral(resourceName: "log-out")]
        }else{
            menuNames = [Localization.get("Login")]
            menuImgs = [#imageLiteral(resourceName: "profile")]
        }
        accountTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNames.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell", for: indexPath) as! AccountTableViewCell
        cell.menuNamesList.text = menuNames[indexPath.row]
        cell.menuImgList.image = menuImgs[indexPath.row]
        return cell
       }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if(Settings.isUserLoggedIn()){
            if(indexPath.row == 0){
            let VC = (self.storyboard?.instantiateViewController(withIdentifier: "MyOrdersVC"))!
                self.navigationController?.pushViewController(VC, animated: true)
            }else if(indexPath.row == 1){
            let VC = (self.storyboard?.instantiateViewController(withIdentifier: "ShowAddVC"))!
            self.navigationController?.pushViewController(VC, animated: true)
            }else if(indexPath.row == 2){
            let VC = (self.storyboard?.instantiateViewController(withIdentifier: "WishListVC"))!
            self.navigationController?.pushViewController(VC, animated: true)
            }else if(indexPath.row == 3){
                let VC:TermsVC = (self.storyboard?.instantiateViewController(withIdentifier: "TermsVC")) as! TermsVC
                VC.from = "about"
            self.navigationController?.pushViewController(VC, animated: true)
            }else if(indexPath.row == 4){
                let VC:TermsVC = (self.storyboard?.instantiateViewController(withIdentifier: "TermsVC")) as! TermsVC
                VC.from = "terms"
            self.navigationController?.pushViewController(VC, animated: true)
            }else if(indexPath.row == 5){
                Settings.loginOut()
                 self.tabBarController?.selectedIndex = 0
                       if let item = self.tabBarController?.tabBar.selectedItem {
                           self.tabBarController?.tabBar(self.tabBarController!.tabBar, didSelect: item)
                           
                       }
            }
         }else{
            let VC = (self.storyboard?.instantiateViewController(withIdentifier: "SignInVC"))!
            self.present(VC, animated: true, completion: nil)
        }
    }
    @IBAction func closeAction(_ sender: UIButton) {
            self.tabBarController?.selectedIndex = 0
                   if let item = self.tabBarController?.tabBar.selectedItem {
                       self.tabBarController?.tabBar(self.tabBarController!.tabBar, didSelect: item)
                       
                   }
      
       
    }
    
}
