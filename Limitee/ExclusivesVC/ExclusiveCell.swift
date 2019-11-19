//
//  ExclusiveCell.swift
//  Limitee
//
//  Created by Apple on 15/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ExclusiveCell: UITableViewCell {

    @IBOutlet weak var exclusiveImgs: UIImageView!
    
    @IBOutlet weak var exclusiveBtn: UIButton!
    
    @IBOutlet weak var productNameLbl: UILabel!
    
    @IBOutlet weak var brandLbl: UILabel!
    
    @IBOutlet weak var rateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        exclusiveBtn.layer.cornerRadius = exclusiveBtn.frame.size.height/2
        exclusiveBtn.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cartBtnAction(_ sender: UIButton) {
        
        
    }
    
    
    
    @IBAction func favoriteBtnAction(_ sender: UIButton) {
    }
    
}
