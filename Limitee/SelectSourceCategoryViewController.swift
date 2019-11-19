//
//  SelectSourceCategoryViewController.swift
//  Nashr
//
//  Created by User on 07/08/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class SelectSourceCategoryViewController: BaseViewController , UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var container: UIView!
    var selectedArea:((_ area:NSDictionary) -> Void)? = nil

    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    var cancel:(() -> Void)?
    var delegate:PopupCloseDelegate?
    var onlyGenerally = false
    var parentCategory:String = ""
    var menuOptionNameArray : NSMutableArray = []
    var searchResults: NSMutableArray = []
    var searchActive : Bool = false
    var resultDict :NSDictionary = [:]
    var areasList :NSArray = []
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.placeholder = Localization.get("Search Area")
        self.buttonCancel.setTitle(Localization.get("cancel"), for: .normal)
        self.labelTitle.text = Localization.get("Select Area")
        self.labelTitle.textAlignment = .center
//        self.labelTitle.backgroundColor = theme_color
//        self.buttonCancel.backgroundColor = theme_color
//        
        self.view.backgroundColor = UIColor.clear
        
        self.container.layer.cornerRadius = 10
        self.container.clipsToBounds = true
        
        self.tableView.register(UINib(nibName: "AreaTableViewCell", bundle: nil), forCellReuseIdentifier: "AreaTableViewCell")
        self.tableView.rowHeight = 50
        
//           let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
//            menuOptionNameArray = delegate.dictionary?.value(forKey: "areas") as! NSMutableArray
        self.makeCall(Page.areaList , params: [:] , completionHandler: { (response) in
                  self.resultDict = response as! NSDictionary
                  self.areasList = self.resultDict.value(forKey: "results") as! NSArray
                  print (self.areasList)
                  self.tableView.reloadData()
                  
                               })
     
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if(searchActive){
            return 1
        }else{
        return self.areasList.count
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive){
            return searchResults.count
        }else{
//        let areas:NSArray = (self.menuOptionNameArray.object(at: section) as! NSDictionary).value(forKey: "list") as! NSArray
        return areasList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ccell:AreaTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "AreaTableViewCell") as! AreaTableViewCell
        if(!searchActive){
//        let areas:NSArray = (self.menuOptionNameArray.object(at: indexPath.section) as! NSDictionary).value(forKey: "list") as! NSArray

        let cat:NSDictionary = areasList[indexPath.row] as! NSDictionary
        
        ccell.labelTitle.text = cat.value(forKey: "area_name") as? String
        }else{
            let cat:NSDictionary = searchResults[indexPath.row] as! NSDictionary
            ccell.labelTitle.text = cat.value(forKey:  "area_name") as? String
        }
        
        return ccell
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        self.cancel?()
        self.delegate?.closePopup(self)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(searchActive){
            
             let cat:NSDictionary = searchResults[indexPath.row] as! NSDictionary
            self.selectedArea?(cat)
            self.delegate?.closePopup(self)
            
        }else{
//        let areas:NSArray = (self.menuOptionNameArray.object(at: indexPath.section) as! NSDictionary).value(forKey: "list") as! NSArray

         let cat:NSDictionary = areasList[indexPath.row] as! NSDictionary
        self.selectedArea?(cat)
        self.delegate?.closePopup(self)
        }
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        let sectionName: String
//        sectionName = (self.menuOptionNameArray.object(at: section) as! NSDictionary).value(forKey: getCurrentLanguageString(key: "title")) as! String
//        return sectionName
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if(searchActive){
//            return 0
//        }else{
//            return 0
//        }
//    }
    // search
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        searchBar.resignFirstResponder();

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        searchBar.resignFirstResponder();
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText=="")
        {
            searchActive = false;
            tableView.reloadData()
            return
        }
        if self.menuOptionNameArray == nil {
            return
        }
        searchResults = []
        
            var areasInSection :NSArray = []
            areasInSection = areasList.filter { (term: Any) in
                return ((term as AnyObject).value(forKey: "area_name") as! String).lowercased() .range(of: searchText.lowercased()) != nil
                } as NSArray
            
            searchResults.addObjects(from: areasInSection as! [Any])
        
        if(searchResults.count == 0){

            searchActive = true;
            self.tableView.reloadData()

        } else {
            searchActive = true;
            self.tableView.reloadData()

        }
    }

    func searchDisplayController(_ controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func filterContentForSearchText(_ searchText: String) {
        // Filter the array using the filter method
        if self.menuOptionNameArray == nil {
            return
        }
        searchResults = []

       var areasInSection :NSArray = []
                  areasInSection = areasList.filter { (term: Any) in
                      return ((term as AnyObject).value(forKey: "area_name") as! String).lowercased() .range(of: searchText.lowercased()) != nil
                      } as NSArray
                  
                  searchResults.addObjects(from: areasInSection as! [Any])

        print(searchResults);
        tableView.reloadData()
    }
}
