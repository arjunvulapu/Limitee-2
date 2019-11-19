//
//  Localization.swift
//  OnItsWay
//
//  Created by User on 13/07/16.
//  Copyright © 2016 User. All rights reserved.
//

import Foundation

class Localization {
//    static let path = NSString.path(withComponents: [NSHomeDirectory(), "Documents", "strings.json"])
    
    enum Language:String {
        case English = "en", Arabic = "ar"
    }
    // to english
    var currentLocale = Language.English
    
    static func currentLanguage() -> Language {
        return sharedInstance.currentLocale
    }
    
    static func isLanguageSet() -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: Settings.Keys.languageSelected.rawValue)
    }
    
    static func changeLanguage(_ language:Language) {
        sharedInstance.currentLocale = language
        
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: Settings.Keys.languageSelected.rawValue)
        defaults.setValue(language.rawValue, forKey: Settings.Keys.currentLangugae.rawValue)
        defaults.set(["en"], forKey: "AppleLanguages")
        defaults.set(["en"], forKey: "NSLanguages")
        defaults.setValue("en", forKey: "AppleLocale")
        defaults.synchronize()
        
      //  let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
      //  delegate.reloadUI()
    }
    
    let json:NSDictionary
    
    func get(_ word:String) -> String {
        var langKey = "english"
        if(self.currentLocale.rawValue == "ar"){
             langKey = "arabic"
        }else{
            langKey = "english"
        }
        let temp:NSDictionary = self.json.object(forKey: langKey) as! NSDictionary
        if((temp.value(forKey: word)) != nil){
        return temp.value(forKey: word) as! String //self.json[self.currentLocale.rawValue][word].stringValue
        }else{
             return word
        }
    }
    
    static func get(_ word:String) -> String {
        return sharedInstance.get(word)
    }
    
    var words:[String:String] = [:]
    static let sharedInstance = Localization()
    
    fileprivate init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.json = appDelegate.dictionary! as! NSDictionary
        print(self.json)
//        let data = try! Data(contentsOf: URL(fileURLWithPath: Localization.path), options: NSData.ReadingOptions.mappedIfSafe)
//        self.json = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSDictionary
        
        let defaults = UserDefaults.standard
        if let lan = defaults.value(forKey: Settings.Keys.currentLangugae.rawValue) as? String {
            if lan == "en" {
                self.currentLocale = Language.English
            } else if lan == "ar" {
                self.currentLocale = Language.Arabic
            }
//            else if lan == "fr" {
//                self.currentLocale = Language.French
//            }
            
        } else {
            self.currentLocale = Language.English
        }
    }
}
