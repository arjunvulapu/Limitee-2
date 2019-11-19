//
//  BaseViewController.swift
//  OnItsWay
//
//  Created by User on 12/07/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import JVFloatLabeledTextField

//extension UILabel {
//
//    var substituteFontName : String {
//        get { return self.font.fontName }
//        set {
//            if self.font.fontName.range(of:"Medium") == nil {
//                self.font = UIFont(name: newValue, size: self.font.pointSize)
//            }
//        }
//    }
//
//    var substituteFontNameBold : String {
//        get { return self.font.fontName }
//        set {
//            if self.font.fontName.range(of:"Medium") != nil {
//                self.font = UIFont(name: newValue, size: self.font.pointSize)
//            }
//        }
//    }
//}

class BaseViewController: UIViewController, UISearchBarDelegate, PopupCloseDelegate,UIScrollViewDelegate ,UISearchDisplayDelegate{
    var requestInProgress = false
    //var request:Request?
    var lastOffsetY :CGFloat = 0
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let str_udid = UIDevice.current.identifierForVendor?.uuidString

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = UIColor.black
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]

//        for familyName:AnyObject in UIFont.familyNames() {
//            print("Family Name: \(familyName)")
//            for fontName:AnyObject in UIFont.fontNamesForFamilyName(familyName as! String) {
//                print("--Font Name: \(fontName)")
//            }
//        }
        
       // UILabel.appearance().substituteFontName = "Poppins-Regular";
      //  UILabel.appearance(whenContainedInInstancesOf: [UIButton.self]).substituteFontName = "Poppins-Regular"
        
    }
    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView){
//        lastOffsetY = scrollView.contentOffset.y
//    }
//    
//    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView){
//        
//        let hide = scrollView.contentOffset.y > self.lastOffsetY
//        self.navigationController?.setNavigationBarHidden(hide, animated: true)
//    }
   
    func showPush(vc: UIViewController){
        let transition:CATransition = CATransition()
        transition.duration = 0.6
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func showpop(){
        let transition:CATransition = CATransition()
        transition.duration = 0.6
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: true)
    }
    func scrollToTop() {
        
    }
    func reloadData(){
        
    }
    
    func closePopup(_ vc: UIViewController) {
        self.dismissPopupViewControllerWithanimationType(MJPopupViewAnimationSlideBottomTop)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showErrorAlert(_ message:String) {
        SweetAlert().showAlert(Localization.get("warning"), subTitle: Localization.get(message), style: .error, buttonTitle: Localization.get("ok"), buttonColor: theme_color)
    }
    
    func showSuccessAlert(_ message:String) {
        SweetAlert().showAlert("", subTitle: Localization.get(message), style: AlertStyle.success, buttonTitle: Localization.get("ok"), buttonColor: theme_color)
    }
    
    func makeCall(_ api:Page, params:[String:AnyObject], showIndicator:Bool = true, failureHandler:((Void)->Void)? = nil, completionHandler:@escaping (_ response:AnyObject)->Void) {
        if !Utils.isInternetAvailable() {
            let vc:InternetStatusViewController = InternetStatusViewController(nibName: "InternetStatusViewController", bundle: nil)
            vc.delegate = self
            self.presentPopupViewController(vc, animationType: MJPopupViewAnimationSlideBottomTop)
            return
        }

//        if requestInProgress {
//            print("**************** cancelling last request is in progress....")
//            request?.cancel()
//            requestInProgress = false
//        }
        
        if showIndicator {
//            SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear)
//            SVProgressHUD.show(UIImage(named: "status")!, status: "")
//            SVProgressHUD.show(withStatus: "Loading")
            SVProgressHUD.show(withStatus: "Loading")


        }
        
        
        self.requestInProgress = true
        var dictionary:[String:AnyObject] = params
        dictionary["lang"] = Localization.currentLanguage().rawValue as AnyObject
        
        
        
        Alamofire.request(Api.getUrl(api),method:.post, parameters: dictionary).responseJSON(completionHandler: { (response) in
            print ("result arrived in base class")
            self.requestInProgress = false
            switch response.result {
            case .success(let JSON):
                completionHandler(JSON as AnyObject)
                
            case .failure(let error):
                //self.showErrorAlert("api_error")
                print("error: \(error)")
//                if failureHandler != nil {
//                    failureHandler!()
//                }
            }
            
                if showIndicator {
                    SVProgressHUD.dismiss()
                }

            })
    }
    
    func makeCallNEW(_ api:Page, params:[String:AnyObject],patametersStr:String, showIndicator:Bool = true, failureHandler:((Void)->Void)? = nil, completionHandler:@escaping (_ response:AnyObject)->Void) {
            if !Utils.isInternetAvailable() {
                let vc:InternetStatusViewController = InternetStatusViewController(nibName: "InternetStatusViewController", bundle: nil)
                vc.delegate = self
                self.presentPopupViewController(vc, animationType: MJPopupViewAnimationSlideBottomTop)
                return
            }

    //        if requestInProgress {
    //            print("**************** cancelling last request is in progress....")
    //            request?.cancel()
    //            requestInProgress = false
    //        }
            
            if showIndicator {
//                SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear)
//                SVProgressHUD.show(UIImage(named: "status")!, status: "")
                SVProgressHUD.show(withStatus: "Loading")
            }
            
            
            self.requestInProgress = true
            var dictionary:[String:AnyObject] = params
          //  dictionary["lang"] = Localization.currentLanguage().rawValue as AnyObject
            
            
            
        Alamofire.request(Api.getUrlWithParamters(api,paramtersSting: patametersStr),method:.post, parameters: dictionary).responseJSON(completionHandler: { (response) in
                print ("result arrived in base class")
                self.requestInProgress = false
                switch response.result {
                case .success(let JSON):
                    completionHandler(JSON as AnyObject)
                    
                case .failure(let error):
                    //self.showErrorAlert("api_error")
                    print("error: \(error)")
    //                if failureHandler != nil {
    //                    failureHandler!()
    //                }
                }
                
                    if showIndicator {
                        SVProgressHUD.dismiss()
                    }

                })
        }
    func makeCallSlave(_ api:Page, params:[String:AnyObject], showIndicator:Bool = true, failureHandler:(()->Void)? = nil, completionHandler:@escaping (_ response:AnyObject)->Void) {
        if !Utils.isInternetAvailable() {
            let vc:InternetStatusViewController = InternetStatusViewController(nibName: "InternetStatusViewController", bundle: nil)
            vc.delegate = self
            self.presentPopupViewController(vc, animationType: MJPopupViewAnimationSlideBottomTop)
            return
        }
        
        //        if requestInProgress {
        //            print("**************** cancelling last request is in progress....")
        //            request?.cancel()
        //            requestInProgress = false
        //        }
        
        if showIndicator {
            SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear)
            SVProgressHUD.show(UIImage(named: "logo.png")!, status: "")
        }
        
        
        self.requestInProgress = true
        var dictionary:[String:AnyObject] = params
        dictionary["lang"] = Localization.currentLanguage().rawValue as AnyObject
        
        
        
        Alamofire.request(Api.getUrlSlave(api),method:.post, parameters: dictionary).responseJSON(completionHandler: { (response) in
            print ("result arrived in base class")
            self.requestInProgress = false
            switch response.result {
            case .success(let JSON):
                completionHandler(JSON as AnyObject)
                
            case .failure(let error):
                //self.showErrorAlert("api_error")
                print("error: \(error)")
                if failureHandler != nil {
                    failureHandler!()
                }
            }
            
            if showIndicator {
                SVProgressHUD.dismiss()
            }
            
        })
    }
    

    func makeCallWithOutProgess(_ api:Page, params:[String:AnyObject], showIndicator:Bool = false , failureHandler:((Void)->Void)? = nil, completionHandler:@escaping (_ response:AnyObject)->Void) {
        if !Utils.isInternetAvailable() {
            let vc:InternetStatusViewController = InternetStatusViewController(nibName: "InternetStatusViewController", bundle: nil)
            vc.delegate = self
            self.presentPopupViewController(vc, animationType: MJPopupViewAnimationSlideBottomTop)
            return
        }
        
        //        if requestInProgress {
        //            print("**************** cancelling last request is in progress....")
        //            request?.cancel()
        //            requestInProgress = false
        //        }
        
        if showIndicator {
            SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear)
            SVProgressHUD.show(UIImage(named: "logo.png")!, status: "")
        }
        
        
        self.requestInProgress = true
        var dictionary:[String:AnyObject] = params
        dictionary["lang"] = Localization.currentLanguage().rawValue as AnyObject
        
        
        Alamofire.request(Api.getUrlSlave(api),method:.post, parameters: dictionary).responseJSON(completionHandler: { (response) in
            print ("result arrived in base class")
            self.requestInProgress = false
            switch response.result {
            case .success(let JSON):
                completionHandler(JSON as AnyObject)
                
            case .failure(let error):
                //self.showErrorAlert("api_error")
                print("error: \(error)")
//                if failureHandler != nil {
//                    failureHandler!()
//                }
            }
            
            if showIndicator {
                SVProgressHUD.dismiss()
            }
            
        })
    }
    func makeRoundCornerWithBorderTo(view: UIView ,color:UIColor){
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = color.cgColor
    }
    func addpaddingtoTextField(textField:UITextField){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 40))
         textField.leftView = paddingView
         textField.leftViewMode = UITextField.ViewMode.always;
    }
    func makeRoundCornerWithBorderToTextField(view: UITextField ,color:UIColor){
//        view.layer.cornerRadius = view.frame.size.height/2
        view.layer.cornerRadius = 4
        
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = color.cgColor
        
        //make text to center
        //view.textAlignment = .center
    }
       func makeRoundCornerWithBorderToTextFieldWithPadding(view: UITextField ,color:UIColor){
    //        view.layer.cornerRadius = view.frame.size.height/2
            view.layer.cornerRadius = 4
            
            view.clipsToBounds = true
            view.layer.borderWidth = 1
            view.layer.borderColor = color.cgColor
            
            //make text to center
            //view.textAlignment = .center
         addpaddingtoTextField(textField:view)


        }
    func isValidEmail(emailStr:String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: emailStr)
        }
    func makecartEmpty(){
        let cartarrayDict:NSMutableArray = []
               let newCartData = NSKeyedArchiver.archivedData(withRootObject: cartarrayDict)
                     UserDefaults.standard.set(newCartData, forKey: "CartProducts")
    }
    func getCurrentLanguageString(key:String) -> String {
        if let Name:String =  UserDefaults.standard.value(forKey:Settings.Keys.currentLangugae.rawValue) as? String {
              if Name == "en" {
                  return key
              }
              else{
                  return key+"_ar"
              }
          }
          else {
              return key
          }
      }
    func makeRoundCornerWithBorderToButton(view: UIButton ,color:UIColor){
        //view.layer.cornerRadius = view.frame.size.height/2
         view.layer.cornerRadius = 4
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = color.cgColor
    }
    func makeRoundCornerWithBorderToTextView(view: UITextView ,color:UIColor){
            view.layer.cornerRadius = 4
            view.clipsToBounds = true
            view.layer.borderWidth = 1
            view.layer.borderColor = color.cgColor
        }
    func makeroundedOnTop(view: UIView){
    let rectShape = CAShapeLayer()
    rectShape.bounds = view.frame
    rectShape.position = view.center
    rectShape.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.bottomLeft , .bottomRight ], cornerRadii: CGSize(width: 40, height: 40)).cgPath
    
    // self.topView.layer.backgroundColor = UIColor.green.cgColor
    //Here I'm masking the textView's layer with rectShape layer
   view.layer.mask = rectShape
    }
    
    func setGradientBackground(view: UIView) {
        let colorTop =  UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = litepink_color.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at:0)
    }
}
extension UIFont {
//    class func appRegularFontWith( size:CGFloat ) -> UIFont{
//        return  UIFont(name: FIOREFONT.RegularFont.rawValue, size: size)!
//    }
//    class func appBoldFontWith( size:CGFloat ) -> UIFont{
//        return  UIFont(name:FIOREFONT.BoldFont.rawValue, size: size)!
//    }
    
    class func boldSystemFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: FIOREFONT.BoldFont.rawValue, size: fontSize)!
    }
    
//    class func systemFont(ofSize fontSize: CGFloat) -> UIFont {
//        return UIFont(name: FIOREFONT.BoldFont.rawValue, size: fontSize)!
//    }
    open class func systemFont(ofSize fontSize: CGFloat) -> UIFont{
        return UIFont(name: FIOREFONT.RegularFont.rawValue, size: fontSize)!

    }
    func shadowToView(view : UIView){
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 3.0
        view.layer.shadowColor = UIColor.darkGray.cgColor
    }
    
    
}
// base 64decode
extension String {
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }

    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    var htmlToAttributedString: NSAttributedString? {
           guard let data = data(using: .utf8) else { return NSAttributedString() }
           do {
               return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
           } catch {
               return NSAttributedString()
           }
       }
       var htmlToString: String {
           return htmlToAttributedString?.string ?? ""
       }
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
