//
//  OrderDetailsVC.swift
//  Limitee
//
//  Created by Apple on 18/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class OrderDetailsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var orderDetailsLbl: UILabel!
    
    @IBOutlet weak var orderDetailsTV: UITableView!
    
    @IBOutlet weak var orderIdLbl: UILabel!
    
    @IBOutlet weak var statusLbl: UILabel!
    
    @IBOutlet weak var rateLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var deliveryAddLbl: UILabel!
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var deliveryAddTV: UITextView!
    
    @IBOutlet weak var subTotLbl: UILabel!
    
    @IBOutlet weak var subTotNoLbl: UILabel!
    
    
    @IBOutlet weak var deliveryLbl: UILabel!
    
    @IBOutlet weak var deliveryNoLbl: UILabel!
    
    
    @IBOutlet weak var grandTotLbl: UILabel!
    
    @IBOutlet weak var grandTotNoLbl: UILabel!
    
    @IBOutlet weak var paymentMetLbl: UILabel!
    
    @IBOutlet weak var paymentMetNoLbl: UILabel!
    
    var brandName:[String] = ["gucci guilty eau de toilets natural spray for women 75 ml","gucci guilty eau de toilets natural spray for women 75 ml","gucci guilty eau de toilets natural spray for women 75 ml","gucci guilty eau de toilets natural spray for women 75 ml"]
           var costs:[String] = ["1007.00","2000.00","500","3500"]
           var quantities:[String] = ["1","5","2","8"]
    override func viewDidLoad() {
        super.viewDidLoad()
        orderIdLbl.text = "Order ID : 100056"
        statusLbl.text = "Status : 1"
        rateLbl.text = "KD 7401.000"
        dateLbl.text = "18-11-2019 01:11pm"
        nameLbl.text = "Arjun vulapu"
        deliveryAddTV.text = "h.no 12-344, gannavaram, vijayawada, building no: 122334"
        subTotNoLbl.text = "7400.000 KD"
        deliveryNoLbl.text = "1.000 KD"
        grandTotNoLbl.text = "7401.000 KD"
        paymentMetNoLbl.text = "1"
       
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brandName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderDetailsTV.dequeueReusableCell(withIdentifier: "OrderDetailsTC") as! OrderDetailsTC
        cell.brandNameLbl.text = brandName[indexPath.row]
        cell.costLbl.text = costs[indexPath.row]
        cell.quantityNoLbl.text = quantities[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
