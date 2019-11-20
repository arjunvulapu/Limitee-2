//
//  ContactUsVC.swift
//  Limitee
//
//  Created by Apple on 13/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ContactUsVC: BaseViewController {
    @IBOutlet weak var contactUsLbl: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!

    @IBOutlet weak var mobileNoTF: UITextField!
    
    @IBOutlet weak var msgTV: UITextView!
    var from:NSString!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.placeholder = Localization.get("Name")
        emailTF.placeholder = Localization.get("Email")
        mobileNoTF.placeholder = Localization.get("Mobile Number")
        nameTF.addBottomBorder()
        emailTF.addBottomBorder()
        mobileNoTF.addBottomBorder()
        msgTV.layer.borderColor = UIColor.gray.cgColor
        msgTV.layer.borderWidth = 1.0
        msgTV.layer.cornerRadius = 10.0
       
        // Do any additional setup after loading the view.
    }
   
    @IBAction func submitBtnAction(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func backAction(_ sender: UIButton) {
        if (from == "menu"){
                    appDelegate.moveStart()
                }else{
        self.navigationController?.popViewController(animated: true)
                }
    }
    
    
}
