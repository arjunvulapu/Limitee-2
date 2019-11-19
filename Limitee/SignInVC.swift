//
//  SignInVC.swift
//  Limitee
//
//  Created by Apple on 14/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SignInVC: BaseViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    var session = URLSession.shared
   
    var loginDict = [String:String]()
    var URLSessionObj: URLSession!
    var URLRequestObj: URLRequest!
    var dataTaskObj: URLSessionDataTask!
    var cart_id:NSString?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userNameTF.addBottomBorder()
        self.passwordTF.addBottomBorder()
 
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        
        
        let dic:NSDictionary = ["customer_mobile_email":userNameTF.text as! String,"password":passwordTF.text as! String]
      

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
//                self.appDelegate.moveStart()
                self.showSuccessAlert(Localization.get(ResultDict.value(forKey: "message") as! String))
                
            }

            })
    }

    @IBAction func forgotPassAction(_ sender: UIButton) {
        
//        let forgotVC = storyboard?.instantiateViewController(identifier: "forgotPassword") as! ForgotPasswordVC
        
    }
    
    
    @IBAction func guestAction(_ sender: UIButton) {
        let VC:SaveAddVC = self.storyboard?.instantiateViewController(identifier: "SaveAddVC") as! SaveAddVC
        VC.cart_id = cart_id
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func createAccAction(_ sender: UIButton) {
        let regVC = storyboard?.instantiateViewController(identifier: "RegisterVC") as! RegisterVC
        self.present(regVC, animated: true, completion: nil)
    }
    
    

}
extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.gray.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
        
    }
   
}

