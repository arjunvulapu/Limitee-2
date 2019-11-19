//
//  RegisterVC.swift
//  Limitee
//
//  Created by Apple on 14/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class RegisterVC: BaseViewController {

    @IBOutlet weak var regLbl: UILabel!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passTF: UITextField!
    
    @IBOutlet weak var confirmPassTF: UITextField!
    
    @IBOutlet weak var mobNoTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTF.placeholder = Localization.get("First Name")
        firstNameTF.addBottomBorder()
        emailTF.placeholder = Localization.get("Email")
        emailTF.addBottomBorder()
        passTF.placeholder = Localization.get("Password")
        passTF.addBottomBorder()
        confirmPassTF.placeholder = Localization.get("Confirm Password")
        confirmPassTF.addBottomBorder()
        mobNoTF.placeholder = Localization.get("Mobile Number")
        mobNoTF.addBottomBorder()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func termsAction(_ sender: UIButton) {
        
    }
    
    @IBAction func closeAct(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
            if(firstNameTF.text?.count == 0){
                       self.showErrorAlert(Localization.get("Enter FullName"))
                   }else if(passTF.text?.count == 0){
                       self.showErrorAlert(Localization.get("Enter Password"))
                   }else if(confirmPassTF.text?.count == 0){
                       self.showErrorAlert(Localization.get("Enter Conform Password"))
                   }else if(passTF.text != confirmPassTF.text){
                       self.showErrorAlert(Localization.get("Enter Password& Conform Passwords are same"))
                   }else if(emailTF.text?.count == 0){
                       self.showErrorAlert(Localization.get("Enter Email Address"))
                   }else if(mobNoTF.text?.count == 0){
                       self.showErrorAlert(Localization.get("Enter Mobile Number"))
                   }
            else{
            let dic:NSDictionary = ["mobie":mobNoTF.text as! String,"password":passTF.text as! String,"first_name":firstNameTF.text as! String,"last_name":" ","email":emailTF.text as! String]
          

            self.makeCall(Page.login , params: dic as! [String : AnyObject] , completionHandler: { (response) in
                    let ResultDict:NSDictionary = response as! NSDictionary
                    print (ResultDict)
                    
                if(ResultDict.value(forKey: "status") as! Int == 0){
                    self.showErrorAlert(Localization.get(ResultDict.value(forKey: "message") as! String))
                }else{
    //                Settings.login("")
                    let ResultDict:NSDictionary = response as! NSDictionary
                    let customerinfo : NSDictionary = ResultDict.value(forKey: "results") as! NSDictionary
                    Settings.login(customerinfo.value(forKey: "customer_id") as! String)
                    self.dismiss(animated: true, completion: nil)
                    self.appDelegate.moveStart()
                    self.showSuccessAlert(Localization.get(ResultDict.value(forKey: "message") as! String))

                }

                })
        }
        }
    
    
}
