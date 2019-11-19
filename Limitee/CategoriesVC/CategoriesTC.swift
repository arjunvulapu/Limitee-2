//
//  CategoriesTC.swift
//  Limitee
//
//  Created by Apple on 15/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class CategoriesTC: UITableViewCell {
    @IBOutlet weak var pImage: UIImageView!
    @IBOutlet weak var pnameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var favBtn: UIButton!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func favBtnAction(_ sender: Any) {
      }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
