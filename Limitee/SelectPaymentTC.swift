//
//  SelectPaymentTC.swift
//  Limitee
//
//  Created by Apple on 18/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SelectPaymentTC: UITableViewCell {
    @IBOutlet weak var paymentBtn: UIButton!
    @IBOutlet weak var paymentImage: UIImageView!
    @IBOutlet weak var paymentName: UILabel!
    var selectPayement:(()->Void)?
    @IBAction func paymentBtn(_ sender: Any) {
        self.selectPayement?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
