//
//  MyOrdersTC.swift
//  Limitee
//
//  Created by Apple on 18/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MyOrdersTC: UITableViewCell {

    @IBOutlet weak var myOrderImgs: UIImageView!
    
    @IBOutlet weak var orderIdLbl: UILabel!
    
    @IBOutlet weak var orderIdShowLbl: UILabel!
    
    @IBOutlet weak var brandNameLbl: UILabel!
    
    
    @IBOutlet weak var brandLbl: UILabel!
    
    @IBOutlet weak var channelLbl: UILabel!
    
    
    @IBOutlet weak var rateLbl: UILabel!
    
    @IBOutlet weak var statusLbl: UILabel!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
