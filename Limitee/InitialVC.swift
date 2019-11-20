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
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func skipAction(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(identifier: "SSCustomTabBarViewController")
        self.navigationController?.pushViewController(nextVC!, animated: true)
//        appDelegate.moveStart()
    }
    
}
