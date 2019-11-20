//
//  AppDelegate.swift
//  Limitee
//
//  Created by Apple on 04/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   

    var window: UIWindow?
    var dictionary:NSDictionary?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        downloadWords()
     
          
        return true
    }
    func moveStart(){
        
//        let rootViewController = self.window!.rootViewController as! UINavigationController
//           let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//           let profileViewController = mainStoryboard.instantiateViewController(withIdentifier: "OrderDetailsVC") as! OrderDetailsVC
//           rootViewController.pushViewController(profileViewController, animated: true)
//
        
            self.window = UIWindow(frame: UIScreen.main.bounds)

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let initialViewController = storyboard.instantiateViewController(withIdentifier: "SSCustomTabBarViewController")

            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
       

  }
    
    
       func downloadWords() {
               let url = NSURL(string: Api.getUrl(Page.wordslist))
               let request = NSURLRequest(url: url! as URL)
               let data:Data? = URLSession.requestSynchronousData(request)! as Data
               //        let data:Data? = URLSession.requestSynchronousData(URLRequest(url:(string: Api.getUrl(Page.settings)) ) as NSURLRequest)
               self.dictionary = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
            print(self.dictionary as Any)
            Settings.wordsDownloaded = true
            if !Localization.isLanguageSet() {
                     Localization.changeLanguage(Localization.Language.English)
                 }
          
           }
    

}

