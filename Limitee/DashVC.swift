//
//  DashVC.swift
//  Limitee
//
//  Created by Apple on 14/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class DashVC: UIViewController {
    
    @IBOutlet weak var leftBarBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftBarBtn.target = revealViewController()
                leftBarBtn.action = #selector(SWRevealViewController.revealToggle(_:))
                self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        let dotsRightBarBtn = UIBarButtonItem(image: UIImage(named: "Group 61"), style: .plain, target: self, action: #selector(dotsBarBtnAction))
               
               let cartRightBarBtn = UIBarButtonItem(image: UIImage(named: "Group 60"), style: .plain, target: self, action: #selector(dotsBarBtnAction))
               
                       let bluetoothBtn = UIBarButtonItem(image: UIImage(named: "003-magnifying-glass"), style: .plain, target: self, action: #selector(bluetoothBarBtnAction))
               
               
               
                       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 40))
                       imageView.contentMode = .scaleAspectFit
                       let image = UIImage(named: "Group 6")
                       imageView.image = image
                       self.navigationItem.titleView = imageView
                       self.navigationItem.rightBarButtonItems = [bluetoothBtn,cartRightBarBtn,dotsRightBarBtn]
               
            
        // Do any additional setup after loading the view.
    }
    
    @objc func dotsBarBtnAction(){
          
      }
      @objc func bluetoothBarBtnAction(){
          
      }
    
    
}
