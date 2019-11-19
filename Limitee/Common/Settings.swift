//
//  AppSettings.swift
//  OnItsWay
//
//  Created by User on 14/07/16.
//  Copyright © 2016 User. All rights reserved.
//

import Foundation

class Settings {
    
    enum Keys:String {
        case loginStatus = "LOGIN_STATUS"
        case areaStatus = "AREA_STATUS"
         case areaSelected = "AREA_SELECTED"
        case areaId = "AREA_ID"
        case areaName = "AREA_NAME"
        case languageSelected = "LANGUAGE_SELECTED"
        case memberId = "MEMBER_ID"
        case currentLangugae = "CURRENT_LANGUAGE"
        case memberName = "MEMBER_NAME"
        case fontSize = "FONT_SIZE"
        case fontStyle = "FONT_STYLE"
        case titleFontSize = "TITLE_FONT_STYLE"
        case wordsDownloaded = "WORDS_DOWNLOADED"
        case lastSloseTime = "LAST_CLOSE_TIME"
        case deviceToken = "DEVICE_TOKEN"
        case urgentNewsNotification = "URGENT_NEWS_NOTIFICATION"
        case nightMode = "NIGHT_MODE"
    }
    
    static var nightMode:Bool? {
        set(value) {
            let defaults = UserDefaults.standard
            defaults.set(value!, forKey:Keys.nightMode.rawValue)
            defaults.synchronize()
        }
        get {
            let defaults = UserDefaults.standard
            return defaults.bool(forKey: Keys.nightMode.rawValue)
        }
    }
    
    static var urgentNewsNotification:Bool? {
        set(value) {
            let defaults = UserDefaults.standard
            defaults.set(value!, forKey:Keys.urgentNewsNotification.rawValue)
            defaults.synchronize()
        }
        get {
            let defaults = UserDefaults.standard
            if((defaults.string(forKey: Keys.urgentNewsNotification.rawValue)) == nil){
                defaults.set("true", forKey:Keys.urgentNewsNotification.rawValue)
                defaults.synchronize()
            }
            return defaults.bool(forKey: Keys.urgentNewsNotification.rawValue)
        }
    }
    
    static var deviceToken:String? {
        set(value) {
            let defaults = UserDefaults.standard
            defaults.setValue(value, forKey: Keys.deviceToken.rawValue)
            defaults.synchronize()
        }
        
        get {
            let defaults = UserDefaults.standard
            return defaults.value(forKey: Keys.deviceToken.rawValue) as? String
        }
    }
    
    static var lastClosetime:Date? {
        set(value) {
            let defaults = UserDefaults.standard
            defaults.setValue(value, forKey: Keys.lastSloseTime.rawValue)
            defaults.synchronize()
        }
        
        get {
            let defaults = UserDefaults.standard
            return defaults.value(forKey: Keys.lastSloseTime.rawValue) as? Date
        }
    }
    
    static var currentFont:(size:Int, style:String) {
        set(values) {
            let defaults = UserDefaults.standard
            defaults.set(values.size, forKey: Keys.fontSize.rawValue)
            defaults.setValue(values.style, forKey: Keys.fontStyle.rawValue)
            defaults.synchronize()
        }
        
        get {
            let defaults = UserDefaults.standard
            if !defaults.dictionaryRepresentation().keys.contains(Keys.fontSize.rawValue) {
                defaults.set(20, forKey: Keys.fontSize.rawValue)
                defaults.setValue("normal", forKey: Keys.fontStyle.rawValue)
                defaults.synchronize()
            }
            
            return (defaults.integer(forKey: Keys.fontSize.rawValue), defaults.value(forKey: Keys.fontStyle.rawValue) as! String)
        }
    }
    
    static var titleFont:(Int) {
        set(value) {
            let defaults = UserDefaults.standard
            defaults.set(value, forKey: Keys.titleFontSize.rawValue)
            defaults.synchronize()
        }
        
        get {
            let defaults = UserDefaults.standard
            if !defaults.dictionaryRepresentation().keys.contains(Keys.titleFontSize.rawValue) {
                defaults.set(20, forKey: Keys.titleFontSize.rawValue)
                defaults.synchronize()
            }
            
            return defaults.integer(forKey: Keys.titleFontSize.rawValue)
        }
    }

    static var wordsDownloaded:Bool {
        set (status){
            let defaults = UserDefaults.standard
            defaults.set(status, forKey: Keys.wordsDownloaded.rawValue)
            defaults.synchronize()
        }
        
        get {
            return UserDefaults.standard.bool(forKey: Keys.wordsDownloaded.rawValue)
        }
    }
    
    static var languageSelected:Bool {
        set (status){
            let defaults = UserDefaults.standard
            defaults.set(status, forKey: Keys.languageSelected.rawValue)
            defaults.synchronize()
        }
        
        get {
            return UserDefaults.standard.bool(forKey: Keys.languageSelected.rawValue)
        }
    }
    
    static func currentUser() -> (id:Int, name:String) {
        let defaults = UserDefaults.standard
        return (id:defaults.integer(forKey: Keys.memberId.rawValue), name:defaults.value(forKey: Keys.memberName.rawValue) as! String)
    }
    static func currentUserID() -> (String) {
        if(isUserLoggedIn()){
          let defaults = UserDefaults.standard
          return defaults.value(forKey: Keys.memberId.rawValue) as! String
        }
        else{
            return "0"
        }
      }
     static func currentAreaID() -> (String) {
          let defaults = UserDefaults.standard
          return defaults.value(forKey: Keys.areaId.rawValue) as! String
      }
    static func currentArea() -> (NSDictionary) {
            let defaults = UserDefaults.standard
            return defaults.value(forKey: Keys.areaSelected.rawValue) as! NSDictionary
        }
//    static func login(_ id:Int, name:String) {
//        let defaults = UserDefaults.standard
//        defaults.set(id, forKey: Keys.memberId.rawValue)
//        defaults.set(true, forKey: Keys.loginStatus.rawValue)
//        defaults.setValue(name, forKey: Keys.memberName.rawValue)
//        defaults.synchronize()
//    }
    static func login(_ id:String) {
        let defaults = UserDefaults.standard
        defaults.set(id, forKey: Keys.memberId.rawValue)
        defaults.set(true, forKey: Keys.loginStatus.rawValue)
       // defaults.setValue(name, forKey: Keys.memberName.rawValue)
        defaults.synchronize()
    }
    static func areasSelected(_ id:String,selectedArea:NSDictionary) {
          let defaults = UserDefaults.standard
          defaults.set(id, forKey: Keys.areaId.rawValue)
          defaults.set(true, forKey: Keys.areaStatus.rawValue)
         defaults.set(selectedArea, forKey: Keys.areaSelected.rawValue)
         // defaults.setValue(name, forKey: Keys.memberName.rawValue)
          defaults.synchronize()
      }
    static func loginOut() {
        let defaults = UserDefaults.standard
        defaults.set("", forKey: Keys.memberId.rawValue)
        defaults.set(false, forKey: Keys.loginStatus.rawValue)
        defaults.setValue("", forKey: Keys.memberName.rawValue)
        defaults.synchronize()
    }
   
    static func isUserLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: Keys.loginStatus.rawValue)
    }
    static func isselectedArea() -> Bool {
        return UserDefaults.standard.bool(forKey: Keys.areaStatus.rawValue)
    }
}
