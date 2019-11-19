//
//  SMNavigationController.swift
//  LNSideMenuEffect
//
//  Created by Luan Nguyen on 6/30/16.
//  Copyright © 2016 Luan Nguyen. All rights reserved.
//

import LNSideMenu

class SMNavigationController: LNSideMenuNavigationController {
  
  fileprivate var items:[String]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    // Using default side menu
    items = ["Home","My Account","Categories","Events","Contact Us"]
//    initialSideMenu(.left)
    // Custom side menu
    //initialCustomMenu(pos: .left)
    if(Localization.currentLanguage() == Localization.Language.Arabic){
      initialCustomMenu(pos: .right)
      }else{
         initialCustomMenu(pos: .left)
      }
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    CategoriesList = appDelegate.dictionary!.value(forKey: "categories") as! NSArray
//    for item in catlist {
//        self.CategoriesList.append(Catgoory(fromDictionary: item as! NSDictionary))
//    }
//    let eventcatlist = appDelegate.dictionary!.value(forKey: "events_categories") as! NSArray
//    for item in eventcatlist {
//        self.EventsList.append(Catgoory(fromDictionary: item as! NSDictionary))
//    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  fileprivate func initialSideMenu(_ position: Position) {
    menu = LNSideMenu(sourceView: view, menuPosition: position, items: items!)
    menu?.menuViewController?.menuBgColor = UIColor.black.withAlphaComponent(0.85)
    menu?.delegate = self
    menu?.underNavigationBar = true
    
    view.bringSubviewToFront(navigationBar)
  }
  
  fileprivate func initialCustomMenu(pos position: Position) {
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LeftMenuTableViewController") as! LeftMenuTableViewController
    vc.delegate = self
    menu = LNSideMenu(navigation: self, menuPosition: position, customSideMenu: vc, size: .custom(UIScreen.main.bounds.width*2/3))
    menu?.delegate = self
    menu?.enableDynamic = true
    // Moving down the menu view under navigation bar
//    menu?.underNavigationBar = true
  }
  
  fileprivate func setContentVC(_ index: Int) {
    print("Did select item at index: \(index)")
    var nViewController: UIViewController? = nil
    if(index == 0){
//        let vc:HomeViewController =  storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        self.setContentViewController(vc)


    }else if(index == 1){
//        let vc:SubCategoryVC =  storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC
//        self.setContentViewController(vc)

    }
//    if let viewController = viewControllers.first , viewController is HomeViewController {
//      nViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
//    } else {
//      nViewController = storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC")
//    }
//    if let viewController = nViewController {
//      self.setContentViewController(viewController)
//    }
    // Test moving up/down the menu view
    if let sm = menu, sm.isCustomMenu {
      menu?.underNavigationBar = false
    }
  }
    fileprivate func setContentVC2(_ index: Int,section:Int,type:String) {
        print("index: \(index),section:\(section),type :\(type)")
        var nViewController: UIViewController? = nil
        
        if(type == "main"){
            if(index == 0){
//                let vc:HomeViewController =  storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//                self.setContentViewController(vc)
            }else if(index == 5){
//                let vc:ContactUsVC =  storyboard?.instantiateViewController(withIdentifier: "ContactUsVC") as! ContactUsVC
//                vc.from = "menu"
//                self.setContentViewController(vc)
            }
        }
        if let sm = menu, sm.isCustomMenu {
          menu?.underNavigationBar = false
        }
      }
}

extension SMNavigationController: LNSideMenuDelegate {
  func sideMenuWillOpen() {
    print("sideMenuWillOpen")
   
  }
  
  func sideMenuWillClose() {
    print("sideMenuWillClose")
  }
  
  func sideMenuDidClose() {
    print("sideMenuDidClose")
  }
  
  func sideMenuDidOpen() {
    print("sideMenuDidOpen")
  }
  
  func didSelectItemAtIndex(_ index: Int) {
    setContentVC(index)
  }
    func didSelectItemAtIndex2(_ index: Int,section:Int,type:String) {
        setContentVC2(index,section: section,type: type)
    }
}

extension SMNavigationController: LeftMenuDelegate {
   
    
  func didSelectItemAtIndex(index idx: Int) {
    menu?.toggleMenu() { [unowned self] in
      self.setContentVC(idx)
    }
  }
    func didSelectItemAtIndex2(index idx: Int,section:Int, type:String) {
      menu?.toggleMenu() { [unowned self] in
        self.setContentVC2(idx, section: section,type: type)
      }
    }
}

