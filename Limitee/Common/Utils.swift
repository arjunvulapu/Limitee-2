//
//  Utils.swift
//  OnItsWay
//
//  Created by User on 14/07/16.
//  Copyright © 2016 User. All rights reserved.
//

import Foundation
import UIKit
import Foundation
import SystemConfiguration

open class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                zeroSockAddress in SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)}
        } ) else {
            return false
            
        }
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) == false {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
        
    }
}

struct Utils {
    
    static func isInternetAvailable() -> Bool {
        var connection = false
        let status = Reach().connectionStatus()
        switch status {
        case .unknown, .offline:
            connection = false
        case .online(.wwan):
            connection = true
        case .online(.wiFi):
            connection = true
        }
        
        return connection
        
        //return Reachability.isConnectedToNetwork()
    }
    
    static func getDecodedString(_ str:String) -> String {
        let data = Data(base64Encoded: str, options: NSData.Base64DecodingOptions(rawValue: 0))
        return String(data: data!, encoding: String.Encoding.utf8)!
    }
    
    static func getViewController(_ id:String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: id)
    }
    
    
    static func getTemplateImage(_ imageName:String) -> UIImage {
        return (UIImage(named: imageName)?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate))!
    }
    func rotateLeft(_ v:UInt16, n:UInt16) -> UInt16 {
        return ((v << n) & 0xFFFF) | (v >> (16 - n))
    }
    
    func rotateLeft(_ v:UInt32, n:UInt32) -> UInt32 {
        return ((v << n) & 0xFFFFFFFF) | (v >> (32 - n))
    }
    
    func rotateLeft(_ x:UInt64, n:UInt64) -> UInt64 {
        return (x << n) | (x >> (64 - n))
    }
    
    func rotateRight(_ x:UInt16, n:UInt16) -> UInt16 {
        return (x >> n) | (x << (16 - n))
    }
    
    func rotateRight(_ x:UInt32, n:UInt32) -> UInt32 {
        return (x >> n) | (x << (32 - n))
    }
    
    func rotateRight(_ x:UInt64, n:UInt64) -> UInt64 {
        return ((x >> n) | (x << (64 - n)))
    }
    
    func reverseBytes(_ value: UInt32) -> UInt32 {
        let tmp1 = ((value & 0x000000FF) << 24) | ((value & 0x0000FF00) << 8)
        let tmp2 = ((value & 0x00FF0000) >> 8)  | ((value & 0xFF000000) >> 24)
        return tmp1 | tmp2
    }

}
