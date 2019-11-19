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
            self.window = UIWindow(frame: UIScreen.main.bounds)

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let initialViewController = storyboard.instantiateViewController(withIdentifier: "SSCustomTabBarViewController")

            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
       

  }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
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

