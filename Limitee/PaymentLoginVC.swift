//
//  PaymentLoginVC.swift
//  Limitee
//
//  Created by Apple on 18/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PaymentLoginVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var paymentList:NSArray = []
    @IBOutlet weak var paymentsTableview: UITableView!
    var resultDict :NSDictionary = [:]
    var mainDic :NSMutableDictionary!

    var selectedPayment:NSString!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
             
        self.makeCall(Page.payment_methods , params: [:]  , completionHandler: { (response) in
                     self.resultDict = response as! NSDictionary
            let results1:NSDictionary = self.resultDict.value(forKey: "results") as! NSDictionary
                     self.paymentList = results1.value(forKey: "payment_methods") as! NSArray
                     print (self.paymentList)
                     self.paymentsTableview.reloadData()
                     
                                  })
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                 
                 return paymentList.count
             }

             func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                     
                     let cell = tableView.dequeueReusableCell(withIdentifier: "SelectPaymentTC", for: indexPath) as! SelectPaymentTC
    let iteminfo:NSDictionary = paymentList.object(at: indexPath.row) as! NSDictionary

       if let imageURL = URL(string:iteminfo.value(forKey: "payment_logo") as! String) {
           cell.paymentImage.sd_setImage(with: imageURL)
           }
       cell.paymentName.text = iteminfo.value(forKey: "payment_name") as! String
                if(iteminfo.value(forKey: "method_id") as! NSString == selectedPayment){
                    cell.paymentBtn.setImage(UIImage(named: "Group 7120"), for: .normal)
                }else{
                    cell.paymentBtn.setImage(UIImage(named: "Ellipse 8"), for: .normal)

                }
                cell.selectPayement = {
                    self.selectedPayment = iteminfo.value(forKey: "method_id") as! NSString
                    self.paymentsTableview.reloadData()
                };
                     return cell
                 
             }

             func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                 return UITableView.automaticDimension
             }

             func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtnAction(_ sender: Any) {
           self.navigationController?.popViewController(animated: true)
       }
    @IBAction func nextStepAction(_ sender: Any) {
        if(selectedPayment.length == 0){
            self.showErrorAlert(Localization.get("Please Select Payment Method"))
        }else{
        mainDic.setValue(selectedPayment, forKey: "payment_method")

        let VC:ReviewOrderVC = self.storyboard?.instantiateViewController(identifier: "ReviewOrderVC") as! ReviewOrderVC
        VC.mainDic = mainDic
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
}
