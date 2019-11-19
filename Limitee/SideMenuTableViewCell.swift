//
//  SideMenuTableViewCell.swift
//  Limitee
//
//  Created by Apple on 13/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var sideImg: UIImageView!
    @IBOutlet weak var sideName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
