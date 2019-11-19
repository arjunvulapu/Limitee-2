//
//  InternetStatusViewController.swift
//  Nashr
//
//  Created by User on 16/09/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class InternetStatusViewController: BaseViewController {

    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonOK: UIButton!
    var delegate:PopupCloseDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Settings.wordsDownloaded {
            self.labelTitle.text = Localization.get("title_offline")
            self.labelMessage.text = Localization.get("message_offline")
            self.buttonOK.setTitle(Localization.get("check_again"), for: UIControl.State())
            self.buttonOK.backgroundColor=theme_color
        }
        
       
        
    }
    
    
//    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
//        lastOffsetY = scrollView.contentOffset.y
//    }
//    
//    override func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView){
//        
//        let hide = scrollView.contentOffset.y > self.lastOffsetY
//        //        self.navigationController?.setNavigationBarHidden(hide, animated: true)
//        self.navigationController?.isNavigationBarHidden = false
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkInternet(_ sender: AnyObject) {
        if Utils.isInternetAvailable() {
            
            // (UIApplication.shared.delegate as! AppDelegate).reloadUI()
        }
    }
    
    @IBAction func checkStatus(_ sender: AnyObject) {
        if Utils.isInternetAvailable() {
            self.delegate?.closePopup(self)
        }
    }
}
