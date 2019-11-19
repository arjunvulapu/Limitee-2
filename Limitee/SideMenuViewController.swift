//
//  SideMenuViewController.swift
//  Limitee
//
//  Created by Apple on 13/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class SideMenuViewController: BaseViewController {

    var sideMenuNames:Array = [String]()
    var sideMenuNamesImages:Array = [UIImage]()
    
    @IBOutlet weak var menuTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuNames = [Localization.get("Limitee"),Localization.get("Exclusive"),Localization.get("Notifications"),Localization.get("About Us"),Localization.get("Contact Us"),Localization.get("FAQs"),Localization.get("Terms and Conditions"),Localization.get("Privacy Policy"),Localization.get("Arabic")]
        sideMenuNamesImages = [#imageLiteral(resourceName: "home-1"),#imageLiteral(resourceName: "shopping-cart-1"),#imageLiteral(resourceName: "ticket"),#imageLiteral(resourceName: "Group 57"),#imageLiteral(resourceName: "profile"),#imageLiteral(resourceName: "email"),#imageLiteral(resourceName: "email"),#imageLiteral(resourceName: "email"),#imageLiteral(resourceName: "email")]
        // Do any additional setup after loading the view.
    }
    


}
extension SideMenuViewController: UITableViewDataSource,UITableViewDelegate{

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return sideMenuNames.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuTableViewCell", for: indexPath) as! SideMenuTableViewCell
        cell.sideName.text = sideMenuNames[indexPath.row]
        cell.sideImg.image = sideMenuNamesImages[indexPath.row]
        return cell
    
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let revealViewControllers:SWRevealViewController = self.revealViewController()
    let cell:SideMenuTableViewCell = tableView.cellForRow(at: indexPath) as! SideMenuTableViewCell
    if cell.sideName.text == "Limitee"
    {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dashVC = mainStoryBoard.instantiateViewController(identifier:"SSCustomTabBarViewController")
        
        let newFrontViewController = UINavigationController.init(rootViewController: dashVC)
        revealViewControllers.pushFrontViewController(newFrontViewController, animated: true)
    }
    if cell.sideName.text == "Brands"
    {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let actionVC = mainStoryBoard.instantiateViewController(withIdentifier: "BrandsVC") as! BrandsVC
        let newFrontViewController = UINavigationController.init(rootViewController: actionVC)
        revealViewControllers.pushFrontViewController(newFrontViewController, animated: true)
    }
    if cell.sideName.text == "Exclusives"
    {
//        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let usersVC = mainStoryBoard.instantiateViewController(withIdentifier: "UsersViewController") as!
//        let newFrontViewController = UINavigationController.init(rootViewController: usersVC)
//        revealViewControllers.pushFrontViewController(newFrontViewController, animated: true)
    }
//    if cell.sideName.text == "Categories"
//    {
//        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let usersVC = mainStoryBoard.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
//        let newFrontViewController = UINavigationController.init(rootViewController: usersVC)
//        revealViewControllers.pushFrontViewController(newFrontViewController, animated: true)
//    }
//    if cell.sideName.text == "Account"
//    {
//        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let usersVC = mainStoryBoard.instantiateViewController(withIdentifier: "RoleViewController") as! RoleViewController
//        let newFrontViewController = UINavigationController.init(rootViewController: usersVC)
//        revealViewControllers.pushFrontViewController(newFrontViewController, animated: true)
//    }
//    if cell.sideName.text == "Contact us"
//    {
//        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let usersVC = mainStoryBoard.instantiateViewController(withIdentifier: "RoleViewController") as! RoleViewController
//        let newFrontViewController = UINavigationController.init(rootViewController: usersVC)
//        revealViewControllers.pushFrontViewController(newFrontViewController, animated: true)
//    }
//    if cell.sideName.text == "FAQ"
//    {
//        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let usersVC = mainStoryBoard.instantiateViewController(withIdentifier: "RoleViewController") as! RoleViewController
//        let newFrontViewController = UINavigationController.init(rootViewController: usersVC)
//        revealViewControllers.pushFrontViewController(newFrontViewController, animated: true)
//    }
    
    
    
    
}
}
