//
//  LeftMenuTableViewController.swift
//  LNSideMenu
//
//  Created by Luan Nguyen on 10/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
protocol LeftMenuDelegate: class {
  func didSelectItemAtIndex(index idx: Int)
    func didSelectItemAtIndex2(index idx: Int,section:Int,type:String)

}


class LeftMenuTableViewController: BaseViewController {
  
  // MARK: IBOutlets
  @IBOutlet weak var userAvatarImg: UIImageView!
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var accounttableView: UITableView!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var myaccountLbl: UILabel!
    @IBOutlet weak var categotiesLbl: UILabel!
    @IBOutlet weak var contactUsLbl: UILabel!
    
    @IBOutlet weak var categoriesheight: NSLayoutConstraint!
    @IBOutlet weak var categoryExpTView: UITableView!
//    @IBOutlet weak var eventExpTView: LUExpandableTableView!
//    @IBOutlet weak var eventsHeight: NSLayoutConstraint!
    @IBOutlet weak var accountHeight: NSLayoutConstraint!
     // var CategoriesList:[Catgoory] = []
    var  catlist :NSArray = []
   //   var EventsList:[Catgoory] = []
    var sideMenuNames:Array = [String]()
      var sideMenuNamesImages:Array = [UIImage]()
      
      @IBOutlet weak var menuTV: UITableView!
      
    // MARK: Properties
 // let kCellIdentifier = "menuCell"
  var items = NSMutableArray()
  weak var delegate: LeftMenuDelegate?
  private let cellReuseIdentifier = "MyCell"
     private let sectionHeaderReuseIdentifier = "MySectionHeader"
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  // let nib = UINib(nibName: "MenuTableViewCell", bundle: nil)
  //  menuTableView.register(nib, forCellReuseIdentifier: kCellIdentifier)
//   categoryExpTView.register(UINib(nibName: "MyExpandableTableViewSectionHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: sectionHeaderReuseIdentifier)
    
    sideMenuNames=[Localization.get("Limitee"),Localization.get("Exclusive"),Localization.get("Notifications"),Localization.get("About Us"),Localization.get("Contact Us"),Localization.get("FAQs"),Localization.get("Terms and Conditions"),Localization.get("Privacy Policy"),Localization.get("Arabic")]
           sideMenuNamesImages = [#imageLiteral(resourceName: "home-1"),#imageLiteral(resourceName: "shopping-cart-1"),#imageLiteral(resourceName: "ticket"),#imageLiteral(resourceName: "Group 57"),#imageLiteral(resourceName: "profile"),#imageLiteral(resourceName: "email"),#imageLiteral(resourceName: "question"),#imageLiteral(resourceName: "question"),#imageLiteral(resourceName: "question"),#imageLiteral(resourceName: "question"),#imageLiteral(resourceName: "question")]
  

  }
    override func viewWillAppear(_ animated: Bool) {
        
    }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
//    menuTableView.reloadSections(IndexSet(integer: 0), with: .none)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

   
  }
    @IBAction func homeBtnAction(_ sender: Any) {
        if let delegate = delegate {
            delegate.didSelectItemAtIndex2(index: 0,section: 0, type: "main")
        }
    }
    
    @IBAction func myaccountbtnAction(_ sender: Any) {
        if(accounttableView.isHidden){
            accounttableView.isHidden = false
           accountHeight.constant = 50
            accounttableView.reloadData()
        }else{
             accounttableView.isHidden = true
            accountHeight.constant = 0
        }
    }
    @IBAction func categoriesbtnAction(_ sender: Any) {
        if(categoryExpTView.isHidden){
            categoryExpTView.isHidden = false
           categoriesheight.constant = 50
            categoryExpTView.reloadData()
        }else{
             categoryExpTView.isHidden = true
            categoriesheight.constant = 0
        }
    }
    @IBAction func eventsBtnAction(_ sender: Any) {
        
    }
    @IBAction func contactUsBtnAction(_ sender: Any) {
    if let delegate = delegate {
               delegate.didSelectItemAtIndex2(index: 5,section: 0, type: "main")
               }
    }
    
}
extension LeftMenuTableViewController: UITableViewDataSource,UITableViewDelegate{

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
    if let delegate = delegate {
        delegate.didSelectItemAtIndex2(index: indexPath.row,section: indexPath.section, type: "category")
    }
    }
}
/*
extension LeftMenuTableViewController: UITableViewDataSource {
  // MARK: - Table view data source
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if(tableView == categoryExpTView){
    return catlist.count
    }else{
    return items.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if(tableView == categoryExpTView){
        let cell:CatTC = tableView.dequeueReusableCell(withIdentifier: "CatTC", for: indexPath) as! CatTC

        let catinfo:NSDictionary = catlist[indexPath.row] as! NSDictionary
//         let subCatList:[SubCatgoory] = catinfo.subCats
//        let subcatinfo:SubCatgoory = subCatList[indexPath.row]
        cell.catTitleLbl.text = catinfo.value(forKey: getCurrentLanguageString(key: "title")) as? String
        categoriesheight.constant = categoryExpTView.contentSize.height

        return cell
    }else{
    let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTC", for: indexPath) as! AccountTC
    cell.menuTitle.text = items[indexPath.row] as! String
    accountHeight.constant = accounttableView.contentSize.height
    return cell
  }
  
}
}
extension LeftMenuTableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     if(tableView == categoryExpTView){
         if let delegate = delegate {
     //      delegate.didSelectItemAtIndex(index: indexPath.row)
             delegate.didSelectItemAtIndex2(index: indexPath.row,section: indexPath.section, type: "category")

         }
          }else{
              if let delegate = delegate {
          //      delegate.didSelectItemAtIndex(index: indexPath.row)
                  delegate.didSelectItemAtIndex2(index: indexPath.row,section: indexPath.section, type: "account")

              }
               }
  }
}
/*
extension LeftMenuTableViewController: LUExpandableTableViewDataSource {
    func numberOfSections(in expandableTableView: LUExpandableTableView) -> Int {
        if(expandableTableView == categoryExpTView){
        return CategoriesList.count
        }else{
        return EventsList.count
        }
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, numberOfRowsInSection section: Int) -> Int {
            let catinfo = CategoriesList[section]
           // let subCatList:[SubCatgoory] = catinfo.subCats
            return 0
            
        
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: "CatTC") as? CatTC else {
            assertionFailure("Cell shouldn't be nil")

            return UITableViewCell()
        }
        if(expandableTableView == categoryExpTView){
                let catinfo = CategoriesList[indexPath.section]
                 let subCatList:[SubCatgoory] = catinfo.subCats
                let subcatinfo:SubCatgoory = subCatList[indexPath.row]
                 cell.catTitleLbl.text = subcatinfo.Title
             }else{
                    let catinfo = EventsList[indexPath.section]
                    let subCatList:[SubCatgoory] = catinfo.subCats
                    let subcatinfo:SubCatgoory = subCatList[indexPath.row]
                    cell.catTitleLbl.text = subcatinfo.Title
             }
        //cell.catTitleLbl.text = "Cell at row \(indexPath.row) section \(indexPath.section)"
        categoriesheight.constant = categoryExpTView.contentSize.height

        return cell
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, sectionHeaderOfSection section: Int) -> LUExpandableTableViewSectionHeader {
        guard let sectionHeader = expandableTableView.dequeueReusableHeaderFooterView(withIdentifier: sectionHeaderReuseIdentifier) as? MyExpandableTableViewSectionHeader else {
            assertionFailure("Section header shouldn't be nil")
            return LUExpandableTableViewSectionHeader()
        }
        if(expandableTableView == categoryExpTView){
            let catinfo = CategoriesList[section]
           sectionHeader.label.text = catinfo.Title
        }else{
            let catinfo = EventsList[section]
            sectionHeader.label.text = catinfo.Title
        }
//        sectionHeader.label.text = "Section \(section)"
        
        return sectionHeader
    }
}

// MARK: - LUExpandableTableViewDelegate

extension LeftMenuTableViewController: LUExpandableTableViewDelegate {
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /// Returning `UITableViewAutomaticDimension` value on iOS 9 will cause reloading all cells due to an iOS 9 bug with automatic dimensions
        return 40
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat {
        /// Returning `UITableViewAutomaticDimension` value on iOS 9 will cause reloading all cells due to an iOS 9 bug with automatic dimensions
        
        return 40
    }
    
    // MARK: - Optional
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select cell at section \(indexPath.section) row \(indexPath.row)")
        categoriesheight.constant = categoryExpTView.contentSize.height
        if(expandableTableView == categoryExpTView){
        if let delegate = delegate {
            delegate.didSelectItemAtIndex2(index: indexPath.row,section: indexPath.section, type: "category")
        }
        }else{
            if let delegate = delegate {
                delegate.didSelectItemAtIndex2(index: indexPath.row,section: indexPath.section, type: "event")
            }
        }
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, didSelectSectionHeader sectionHeader: LUExpandableTableViewSectionHeader, atSection section: Int) {
        print("Did select section header at section \(section)")
        categoriesheight.constant = categoryExpTView.contentSize.height
        if let delegate = delegate {
            delegate.didSelectItemAtIndex2(index: section, section: section, type: "category")
        }
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Will display cell at section \(indexPath.section) row \(indexPath.row)")
       // categoriesheight.constant = categoryExpTView.contentSize.height

    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, willDisplaySectionHeader sectionHeader: LUExpandableTableViewSectionHeader, forSection section: Int) {
        print("Will display section header for section \(section)")
        categoryExpTView.layoutIfNeeded()
        categoriesheight.constant = categoryExpTView.contentSize.height
       
    }

    func expandableTableView(_ expandableTableView: LUExpandableTableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func expandableTableView(_ expandableTableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}
 */*/
