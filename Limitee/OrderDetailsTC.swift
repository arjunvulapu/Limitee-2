//
//  OrderDetailsTC.swift
//  Limitee
//
//  Created by Apple on 18/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class OrderDetailsTC: UITableViewCell {

    @IBOutlet weak var brandNameLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var quantityNoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
