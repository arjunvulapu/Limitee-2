//
//  SaveAddVC.swift
//  Limitee
//
//  Created by Apple on 18/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SaveAddVC: BaseViewController {

    @IBOutlet weak var guestLbl: UILabel!
    
    @IBOutlet weak var loginLbl: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var areaTF: UITextField!
    
    @IBOutlet weak var blockTF: UITextField!
    
    @IBOutlet weak var streetTF: UITextField!
    
    @IBOutlet weak var avenueTF: UITextField!
    
    
    @IBOutlet weak var houseTF: UITextField!
    
    
    @IBOutlet weak var floorNoTF: UITextField!
    
    @IBOutlet weak var flatNoTF: UITextField!
    
    @IBOutlet weak var mobileNoTF: UITextField!
    
    
    @IBOutlet weak var noteLbl: UILabel!
    var cart_id:NSString?

    @IBOutlet weak var noteTV: UITextView!
    var selectedaddress:NSDictionary = [:]
    var mainDict:NSMutableDictionary = [:]
    @IBOutlet weak var saveAddBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.addBottomBorder()
        areaTF.addBottomBorder()
        blockTF.addBottomBorder()
        streetTF.addBottomBorder()
        avenueTF.addBottomBorder()
        houseTF.addBottomBorder()
        floorNoTF.addBottomBorder()
        flatNoTF.addBottomBorder()
        mobileNoTF.addBottomBorder()
        saveAddBtn.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAdd(_ sender: UIButton) {
        if(nameTF.text?.count == 0){
            self.showErrorAlert(Localization.get("Enter Name"))
        }else if(areaTF.text?.count == 0){
            self.showErrorAlert(Localization.get("Enter Area"))
        }else if(blockTF.text?.count == 0){
            self.showErrorAlert(Localization.get("Enter Block"))
        }else if(streetTF.text?.count == 0){
            self.showErrorAlert(Localization.get("Enter Street"))
        }else if(avenueTF.text?.count == 0){
            self.showErrorAlert(Localization.get("Enter Avenue"))
        }else if(houseTF.text?.count == 0){
            self.showErrorAlert(Localization.get("Enter House Number"))
        }else if(floorNoTF.text?.count == 0){
            self.showErrorAlert(Localization.get("Enter Floor Number"))
        }else if(flatNoTF.text?.count == 0){
            self.showErrorAlert(Localization.get("Enter Flat Number"))
        }else if(mobileNoTF.text?.count == 0){
            self.showErrorAlert(Localization.get("Enter Mobile Number"))
        }else{
            mainDict.setValue(cart_id!, forKey: "cart_id")
            mainDict.setValue("0", forKey: "customer_id")
            mainDict.setValue("0", forKey: "address_id")
            mainDict.setValue("1", forKey: "is_guest")
            mainDict.setValue(nameTF.text, forKey: "guest_fullname")
            mainDict.setValue(mobileNoTF.text, forKey: "guest_mobile")
            mainDict.setValue("test@gmail.com", forKey: "guest_email")
            mainDict.setValue(selectedaddress.value(forKey: "id"), forKey: "area_id")
            
            mainDict.setValue(selectedaddress.value(forKey: "delivery_charges"), forKey: "delivery_charges")

            mainDict.setValue(blockTF.text, forKey: "block")
            mainDict.setValue(streetTF.text, forKey: "street")
            mainDict.setValue(houseTF.text, forKey: "building_number")
            mainDict.setValue(floorNoTF.text, forKey: "floor_number")
            mainDict.setValue(flatNoTF.text, forKey: "apartment_number")
            mainDict.setValue(noteTV.text, forKey: "notes")

            let VC:PaymentViewController = self.storyboard?.instantiateViewController(identifier: "PaymentViewController") as! PaymentViewController
            VC.mainDic = mainDict
          self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    @IBAction func areBtnAction(_ sender: Any) {
                    let vc:SelectSourceCategoryViewController = SelectSourceCategoryViewController(nibName: "SelectSourceCategoryViewController", bundle: nil)
                    vc.cancel = {
                    }
               
                    vc.selectedArea = { area in
                            print(area)
                        self.selectedaddress = area
                        self.areaTF.text = area.value(forKey: "area_name") as! String
                        
        }
                    vc.delegate = self
                    self.presentPopupViewController(vc, animationType: MJPopupViewAnimationSlideLeftLeft)
            }
    
    @IBAction func backBtnAction(_ sender: Any) {
           self.navigationController?.popViewController(animated: true)
       }
}
