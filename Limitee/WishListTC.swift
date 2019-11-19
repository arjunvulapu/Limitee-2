//
//  WishListTC.swift
//  Limitee
//
//  Created by Apple on 15/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class WishListTC: UITableViewCell {

    
    @IBOutlet weak var wishListImgs: UIImageView!
    
    @IBOutlet weak var productLbl: UILabel!
    
    @IBOutlet weak var rateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func cartAction(_ sender: UIButton) {
    }
    @IBAction func favoriteAction(_ sender: UIButton) {
    }
    

}
