//
//  MyBagTC.swift
//  Limitee
//
//  Created by Apple on 16/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MyBagTC: UITableViewCell {

    @IBOutlet weak var myBagImgs: UIImageView!
    
    @IBOutlet weak var prodNameLbl: UILabel!
    
    @IBOutlet weak var rateLbl: UILabel!
    
    @IBOutlet weak var numLbl: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    var plusAction:(()-> Void)?
    var negitiveAction:(()-> Void)?
    var deleteAction:(()-> Void)?
    var favAction:(()-> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func plusBtnAction(_ sender: UIButton) {
        self.plusAction?()
    }
    @IBAction func minusBtnAction(_ sender: UIButton) {
        self.negitiveAction?()
    }
    
    @IBAction func closeBtnAction(_ sender: UIButton) {
        self.deleteAction?()
    }
    
    @IBAction func favBtnAction(_ sender: UIButton) {
        self.favAction?()
    }
    
    
}
