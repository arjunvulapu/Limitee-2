//
//  Constants.swift
//  OnItsWay
//
//  Created by User on 13/07/16.
//  Copyright © 2016 User. All rights reserved.
//

import Foundation

enum Page: String {
    case brandsList = "brands.php"
    case wordslist = "words.php"
    case categoriesList = "categories.php"
    case Home = "home.php"
     case login = "login.php"
    case register = "register.php"
    case forgotPassword = "forgot_password.php"
    case exclusive_products = "exclusive_products.php"
    case all_products = "all_products.php"
    case add_tocart = "add_to_cart.php"
    case view_cart = "view_cart.php"
    case my_favorites = "my_favorites.php"
    case areaList = "areas.php"
    case payment_methods = "payment_methods.php"
    case delete_cart_item = "delete_cart_item.php"
    case order_placing = "bookings.php"
    case myOrders = "my_orders.php"
    case manageAddress = "manage_addresses.php"
    case add_remove_favorites = "add_remove_favorites.php"
    case terms_and_conditions = "terms_and_conditions.php"
    case privacy_policy = "privacy_policy.php"
    case about_us = "about_us.php"

}
enum FIOREFONT: String {
    case RegularFont = "Nunito-Regular"
   case BoldFont  = "Nunito-Bold"
     case MediumFont  = "Nunito-Medium"
//      case ExtraLightFont  = "Poppins-ExtraLight"
}



class Api {
    
    //static let BASE_URL = "http://3ajelapp.com/nashr/api/"
    //static let BASE_URL = "http://nashrapp.com/api/"
    //static let BASE_URL = "http://clients.yellowsoft.in/LetUKnow/api/"
    
    //static let BASE_URL = "http://clients.yellowsoft.in/nashr/api/"
    
    //for letuknow
    //static let BASE_URL2 = "https://letuknow.co.in/apiv2"
    //static let BASE_URL = "https://letuknow.co.in/apiv2/"
    
    //working
    static let BASE_URL2 = "http://naqshapp.com/apiv2"
//    static let BASE_URL = "http://ioslave.naqshapp.com/apiv2/"
    static let BASE_URL = "http://limitee.safacs.org/limiteews"

    static func getUrl(_ page:Page) -> String {
        let str = String(format: "%@/%@", BASE_URL, page.rawValue)
        print ("url \(str)")
        return str
    }
    static func getUrlWithParamters(_ page:Page ,paramtersSting:String) -> String {
        let str = String(format: "%@/%@/%@", BASE_URL, page.rawValue,paramtersSting)
        print ("url \(str)")
        return str
    }
    static func getUrlSlave(_ page:Page) -> String {
        let str = String(format: "%@/%@", BASE_URL2, page.rawValue)
        print ("url \(str)")
        return str
    }
}
