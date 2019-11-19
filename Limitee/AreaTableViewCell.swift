//
//  CategoryTableViewCell.swift
//  Nashr
//
//  Created by User on 31/07/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class AreaTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCategory: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
        let defaults = UserDefaults.standard
                if let lan = defaults.value(forKey: Settings.Keys.currentLangugae.rawValue) as? String {
                    if(lan == "en"){
                      //  UILabel.appearance().textAlignment = .left
                      //  UITextField.appearance().textAlignment = .left
                       labelTitle.textAlignment = .left
                    }else{
                        //UILabel.appearance().textAlignment = .right
                       // UITextField.appearance().textAlignment = .right
                        labelTitle.textAlignment = .right
                    }
                }
                    
                else{

                   labelTitle.textAlignment = .left

                }

    }

//    override func setSelected(selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    
    
}
