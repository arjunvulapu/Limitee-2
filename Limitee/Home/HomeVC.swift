//
//  HomeVC.swift
//  Limitee
//
//  Created by Apple on 04/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SVProgressHUD
import LNSideMenu

class HomeVC: BaseViewController , iCarouselDataSource, iCarouselDelegate {
    @IBOutlet weak var firstCarousel: iCarousel!
    @IBOutlet weak var exclusiveCarousal: iCarousel!
    @IBOutlet weak var exclusiveTitle: UILabel!
    
    @IBOutlet weak var brandsCarousal: iCarousel!
    @IBOutlet weak var categoriesCarousel: iCarousel!
    @IBOutlet weak var viewLbl: UILabel!
    
    @IBOutlet weak var sideMenuBtn: UIButton!
    
    var menuBar: SideMenuViewController!

    var images : NSMutableArray = NSMutableArray()
    var selectedIndex : Int!
    var homeInfo : NSDictionary!
    var bannersList:NSArray! = []
    var exclusiveList:NSArray!  = []
    var brandsList:NSArray! = []
    var categoriesList:NSArray! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "Group 5"), style: .plain, target: self, action: #selector(sidemenuBtnActon(_:)))
        let dotsRightBarBtn = UIBarButtonItem(image: UIImage(named: "Group 61"), style: .plain, target: self, action: #selector(movetobag))
              
              let cartRightBarBtn = UIBarButtonItem(image: UIImage(named: "Group 60"), style: .plain, target: self, action: #selector(movetoWish))
              
                      let bluetoothBtn = UIBarButtonItem(image: UIImage(named: "003-magnifying-glass"), style: .plain, target: self, action: #selector(movetoWish))
              
              
              
                      let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 30))
                      imageView.contentMode = .scaleAspectFit
                      let image = UIImage(named: "Group 6")
                      imageView.image = image
                      self.navigationItem.titleView = imageView
       
        self.navigationItem.leftBarButtonItem = leftBarButton
                      self.navigationItem.rightBarButtonItems = [bluetoothBtn,cartRightBarBtn,dotsRightBarBtn]
              
             
        
        
        
        
        
        images = NSMutableArray(array: ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"])
//        viewLbl.numberOfLines = 0
//        viewLbl.lineBreakMode = .byCharWrapping
        firstCarousel.type = iCarouselType.linear
        firstCarousel .reloadData()
        exclusiveCarousal.type = iCarouselType.invertedTimeMachine
        exclusiveCarousal .reloadData()
        brandsCarousal.type = iCarouselType.invertedTimeMachine
        brandsCarousal .reloadData()
        categoriesCarousel.type = iCarouselType.rotary
        categoriesCarousel.perspective = -0.005
        categoriesCarousel .reloadData()
        exclusiveCarousal.currentItemIndex = 0
        brandsCarousal.currentItemIndex = 0
        categoriesCarousel.currentItemIndex = 0
        firstCarousel.currentItemIndex = 0
        firstCarousel.scrollSpeed = 0.5
        categoriesCarousel.scrollSpeed = 0.5
        brandsCarousal.scrollSpeed = 0.5
        exclusiveCarousal.scrollSpeed = 0.5
        SVProgressHUD.show(withStatus: "Loading")

        self.makeCall(Page.Home , params: [:] , completionHandler: { (response) in
                      let ResultDict:NSDictionary = response as! NSDictionary
                      print (ResultDict)
                      
                      self.homeInfo = ResultDict.value(forKey: "results") as! NSDictionary
            self.bannersList = self.homeInfo.value(forKey: "banners") as! NSArray
            self.exclusiveList = self.homeInfo.value(forKey: "exclusive") as! NSArray
            self.brandsList = self.homeInfo.value(forKey: "brands") as! NSArray
            self.categoriesList = self.homeInfo.value(forKey: "categories") as! NSArray

            self.firstCarousel .reloadData()
                               self.exclusiveCarousal .reloadData()
                                self.brandsCarousal .reloadData()
                                self.categoriesCarousel .reloadData()
                                self.exclusiveCarousal.currentItemIndex = 0
                                self.brandsCarousal.currentItemIndex = 0
                                self.categoriesCarousel.currentItemIndex = 0
                                self.firstCarousel.currentItemIndex = 0
                  })
        
//        menuBar = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as? SideMenuViewController
   //        view.addGestureRecognizer((revealViewController()?.tapGestureRecognizer())!)
       setupNavforDefaultMenu()

    }
    private func setupNavforDefaultMenu() {
    //       barButton.image = UIImage(named: "burger")?.withRenderingMode(.alwaysOriginal)
           // Set navigation bar translucent style
           self.navigationBarTranslucentStyle()
           // Update side menu
           sideMenuManager?.instance()?.menu?.isNavbarHiddenOrTransparent = true
           // Re-enable sidemenu
           sideMenuManager?.instance()?.menu?.disabled = false
         }
    @objc func movetoWish(){
           let VC = (self.storyboard?.instantiateViewController(withIdentifier: "WishListVC"))!
                     self.navigationController?.pushViewController(VC, animated: true)
       }
       @objc func bluetoothBarBtnAction(){
           
       }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: icarousel delegate methods
    func numberOfItems(in carousel: iCarousel) -> Int {
        if(carousel == firstCarousel){
            
        return bannersList.count
        }else if(carousel == exclusiveCarousal){
        return exclusiveList.count
        }else if(carousel == brandsCarousal){
        return brandsList.count
        }else if(carousel == categoriesCarousel){
        return categoriesList.count
        }else {
           return 0
        }
    }
    
    func carousel(_ carousel: iCarousel?, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        var result: CGFloat

        switch option {
        case .spacing:
            if(carousel == categoriesCarousel){
                result = 1.3 // If the width of your items is 40 e.g, the spacing would be 4 px.
            }else{
                result = value
            }
            default:
                result = value
        }

        return result
    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView
    {
        if(carousel == firstCarousel){
        var itemView: UIImageView
        if (view == nil)
        {
            itemView = UIImageView(frame:firstCarousel.frame)
            itemView.contentMode = .scaleAspectFit
        }
        else
        {
            itemView = view as! UIImageView;
        }
           // itemView.backgroundColor = UIColor.white

//        itemView.image = UIImage(named: "\(images.object(at: index))")
            let projectInfo:NSDictionary = bannersList[index] as! NSDictionary
                         if let imageURL = URL(string:projectInfo.value(forKey: "img") as! String) {
                             itemView.sd_setImage(with: imageURL)
                         }
        return itemView
        }else if(carousel == exclusiveCarousal){
        var bgView : UIView
        var itemView: UIImageView
        var itemLbl: UILabel
       
            bgView = UIImageView(frame: CGRect(x: 0, y: 0, width: exclusiveCarousal.frame.size.width, height: exclusiveCarousal.frame.size.height))
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: exclusiveCarousal.frame.size.width, height: exclusiveCarousal.frame.size.height-40))
            itemView.contentMode = .scaleAspectFit
            itemLbl = UILabel(frame: CGRect(x: 0, y: exclusiveCarousal.frame.size.height-40+5, width: exclusiveCarousal.frame.size.width, height:40))
            itemLbl.textAlignment = .center
            bgView.backgroundColor = UIColor.white

            bgView.addSubview(itemView)
            bgView.addSubview(itemLbl)
        let projectInfo:NSDictionary = exclusiveList[index] as! NSDictionary
               itemLbl.text = String(format:"%@",projectInfo.value(forKey: "product_name") as! String)
               if let imageURL = URL(string:projectInfo.value(forKey: "product_image") as! String) {
                   itemView.sd_setImage(with: imageURL)
               }
//        itemView.image = UIImage(named: "\(images.object(at: index))")
//        itemLbl.text = String(format: "title-%d", index)
        
        return bgView
        }else if(carousel == brandsCarousal){
          var bgView : UIView
          var itemView: UIImageView
          var itemLbl: UILabel
              bgView = UIImageView(frame: CGRect(x: 0, y: 0, width: exclusiveCarousal.frame.size.width, height: exclusiveCarousal.frame.size.height))
              itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: exclusiveCarousal.frame.size.width, height: exclusiveCarousal.frame.size.height-40))
              itemView.contentMode = .scaleAspectFit
              itemLbl = UILabel(frame: CGRect(x: 0, y: exclusiveCarousal.frame.size.height-40+5, width: exclusiveCarousal.frame.size.width, height:40))
              itemLbl.textAlignment = .center
            bgView.backgroundColor = UIColor.white

              bgView.addSubview(itemView)
              bgView.addSubview(itemLbl)
          
          let projectInfo:NSDictionary = brandsList[index] as! NSDictionary
                        itemLbl.text = String(format:"%@",projectInfo.value(forKey: "brand_name") as! String)
                        if let imageURL = URL(string:projectInfo.value(forKey: "brand_image") as! String) {
                            itemView.sd_setImage(with: imageURL)
                        }
//          itemView.image = UIImage(named: "\(images.object(at: index))")
//          itemLbl.text = String(format: "title-%d", index)
          
          return bgView
          }else {
           var bgView : UIView
           var itemView: UIImageView
           var itemLbl: UILabel

               bgView = UIImageView(frame: CGRect(x: 0, y: 0, width: exclusiveCarousal.frame.size.width, height: exclusiveCarousal.frame.size.height))
               itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: exclusiveCarousal.frame.size.width, height: exclusiveCarousal.frame.size.height-40))
               itemView.contentMode = .scaleAspectFit
               itemLbl = UILabel(frame: CGRect(x: 0, y: exclusiveCarousal.frame.size.height-40+5, width: exclusiveCarousal.frame.size.width, height:40))
               itemLbl.textAlignment = .center
            bgView.backgroundColor = UIColor.white

               bgView.addSubview(itemView)
               bgView.addSubview(itemLbl)
           let projectInfo:NSDictionary = categoriesList[index] as! NSDictionary
                         itemLbl.text = String(format:"%@",projectInfo.value(forKey: "category_name") as! String)
                         if let imageURL = URL(string:projectInfo.value(forKey: "category_image") as! String) {
                             itemView.sd_setImage(with: imageURL)
                         }
//
//           itemView.image = UIImage(named: "\(images.object(at: index))")
//           itemLbl.text = String(format: "title-%d", index)
           
           return bgView
           }
    }
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        selectedIndex = index
        print(selectedIndex)

        if(carousel == exclusiveCarousal){
            print(selectedIndex)
            let VC:DetailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
                       let projectInfo:NSDictionary = exclusiveList[index] as! NSDictionary
                    VC.projectinfo = projectInfo;
                              self.navigationController?.pushViewController(VC, animated: true)
        }else if(carousel == brandsCarousal){
            let VC:CategoriesVC = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesVC") as! CategoriesVC
            let projectInfo:NSDictionary = brandsList[index] as! NSDictionary
                   VC.category_id = projectInfo.value(forKey: "brand_id") as! NSString
                   VC.category_name = projectInfo.value(forKey: "brand_name") as! NSString
                   self.navigationController?.pushViewController(VC, animated: true)
        }
    }
     
    
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "imageDisplaySegue")
        {
//            var viewController : ImageDisplayViewController = segue.destination as! ImageDisplayViewController
//            viewController.selectedImage = UIImage(named: "\(images.object(at: selectedIndex))")
        }
    }
    
    @IBAction func sidemenuBtnActon(_ sender: Any) {
                sideMenuManager?.toggleSideMenuView()

    }
    @objc func movetobag(){
        let VC = self.storyboard?.instantiateViewController(identifier: "MyBagVC")
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    @IBAction func viewAllExclusiveBtnAction(_ sender: Any) {
        let VC = self.storyboard?.instantiateViewController(identifier: "ExclusiveVC")
        self.navigationController?.pushViewController(VC!, animated: true)
    }
    @IBAction func viewAllBrandsBtnAction(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
        if let item = self.tabBarController?.tabBar.selectedItem {
                   self.tabBarController?.tabBar(self.tabBarController!.tabBar, didSelect: item)
                   
               }
    }
}
