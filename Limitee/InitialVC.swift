//
//  InitialVC.swift
//  Limitee
//
//  Created by Apple on 19/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class InitialVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func skipAction(_ sender: UIButton) {
        appDelegate.moveStart()
    }
    
}
