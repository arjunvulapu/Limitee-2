//
//  TermsVC.swift
//  Limitee
//
//  Created by Apple on 14/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TermsVC: BaseViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    var resultDict:NSDictionary!
    var resultDict1:NSDictionary!
    var from:NSString?
    var fromWhere:NSString?
    override func viewDidLoad() {
        super.viewDidLoad()
        if(from == "about"){
        self.makeCall(Page.about_us , params: [:]  , completionHandler: { (response) in
            self.resultDict = response as? NSDictionary
            self.resultDict1 = self.resultDict.value(forKey: "results") as? NSDictionary
            self.loadDetails()
    
        })
        }else if(from == "terms"){
            self.makeCall(Page.terms_and_conditions , params: [:]  , completionHandler: { (response) in
                self.resultDict = response as? NSDictionary
                self.resultDict1 = self.resultDict.value(forKey: "results") as? NSDictionary
                self.loadDetails()
        
            })
            }else if(from == "privacy"){
                self.makeCall(Page.privacy_policy , params: [:]  , completionHandler: { (response) in
                    self.resultDict = response as? NSDictionary
                    self.resultDict1 = self.resultDict.value(forKey: "results") as? NSDictionary
                    self.loadDetails()
            
                })
                }
    }
    func loadDetails(){
        titleLbl.text = resultDict1.value(forKey: "page_name") as! String
        let desStr = resultDict1.value(forKey: "page_description") as! String
        descTextView.attributedText = desStr.htmlToAttributedString
    }
    @IBAction func backBtnAction(_ sender: Any) {
        if (from == "menu"){
            appDelegate.moveStart()
        }else{
self.navigationController?.popViewController(animated: true)
        }
    }
}
