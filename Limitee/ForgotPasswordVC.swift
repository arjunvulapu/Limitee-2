//
//  ForgotPasswordVC.swift
//  Limitee
//
//  Created by Apple on 14/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ForgotPasswordVC: BaseViewController {

    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTF.addBottomBorder()
        // Do any additional setup after loading the view.
    }
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        let dic:NSDictionary = ["email":emailTF.text as! String, "lang":"en"]
          

            self.makeCall(Page.forgotPassword , params: dic as! [String : AnyObject] , completionHandler: { (response) in
                    let ResultDict:NSDictionary = response as! NSDictionary
                    print (ResultDict)
                    
                if(ResultDict.value(forKey: "status") as! Int == 0){
                    self.showErrorAlert(Localization.get(ResultDict.value(forKey: "message") as! String))
                }
                    
                })
        }
        
        
    }
    

