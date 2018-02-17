//
//  ViewController_Extension.swift
//  MalaBes
//
//  Created by PUNDSK006 on 4/18/17.
//  Copyright © 2017 Intechcreative Pvt. Ltt. All rights reserved.
//

import Foundation
import UIKit


extension UIApplication {
    
    var screenShot: UIImage?  {
        
        if let rootViewController = keyWindow?.rootViewController {
            let scale = UIScreen.main.scale
            let bounds = rootViewController.view.bounds
            UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale);
            if let _ = UIGraphicsGetCurrentContext() {
                rootViewController.view.drawHierarchy(in: bounds, afterScreenUpdates: true)
                let screenshot = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return screenshot
            }
        }
        return nil
    }
}


extension UIViewController
{
    
    // MARK: UIActivityIndicatorView
    
    var activityIndicatorTag : Int { return 9999 }
    
    var viewTag : Int { return 999 }
    
    
    func startActivityIndicator(
        style: UIActivityIndicatorViewStyle? = nil,
        location: CGPoint? = nil)
    {
        
        let loc = location ?? self.view.center
        let styl = style ?? .whiteLarge
        
        DispatchQueue.main.async {
            
            
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: styl)
            
            let view1 = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height))
            view1.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.2)
            
            //Add the tag so we can find the view in order to remove it later
            activityIndicator.tag = self.activityIndicatorTag
            view1.tag = self.viewTag
            
            //Set the location
            activityIndicator.center = loc
            
            activityIndicator.hidesWhenStopped = true
            
            //Start animating and add the view
            activityIndicator.startAnimating()
            self.view.addSubview(view1)
            
            // self.view.addSubview(view1)
            // view1.addSubview(activityIndicator)
            
            
            
        }
        
    }
    
    //StopActivity
    
    func stopActivityIndicator()
    {
        
        DispatchQueue.main.async {
            
            //            if let activityIndicator = self.view.subviews.filter(
            //                { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
            //                activityIndicator.stopAnimating()
            //                activityIndicator.removeFromSuperview()
            //            }
            
            
            if let view =  self.view.subviews.filter(
                { $0.tag == self.viewTag }).first {
                //activityIndicator.stopAnimating()
                view.removeFromSuperview()
            }
        }
        
        
    }
    
    
    func createSettingsAlertController(title: String, message: String) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment:"" ), style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment:"" ), style: .default, handler: { action in
            UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
        })
        controller.addAction(cancelAction)
        controller.addAction(settingsAction)
        
        return controller
    }
    
    
    
    
    
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    
    
    // MARK: navigationController :- Set Back Button
    
    func setNaviBackButton()
    {
        //Design Of Navigation Bar Back_Button
        
        let btnBack = UIButton(frame: CGRect(x: 0, y:0, width:20,height: 20))
        btnBack.setImage(UIImage(named:"btnBack"), for: .normal)
        btnBack.addTarget(self,action: #selector(back), for: .touchUpInside)
        
        
        let backBarButtonitem = UIBarButtonItem(customView: btnBack)
        let arrLeftBarButtonItems : Array = [backBarButtonitem]
        self.navigationItem.leftBarButtonItems = arrLeftBarButtonItems
    }
    
   
    
    // MARK: navigationController :- Set Back Action
    
    func back()
    {
        stopActivityIndicator()
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}




extension NSMutableAttributedString
{
    func widthOfString(usingFont font: UIFont) -> CGFloat
    {
        _ = [NSFontAttributeName: font]
        let size = self.size()
        return size.width
    }
}

extension UIImageView
{
    public func maskCircle(anyImage: UIImage)
    {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
}



extension UIScrollView
{
    func scrollToTop()
    {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
}

extension UIProgressView
{
    @IBInspectable var barHeight : CGFloat
        {
        get {
            return transform.d * 2.0
        }
        set {
            // 2.0 Refers to the default height of 2
            let heightScale = newValue / 2.0
            let c = center
            //transform = CGAffineTransformMakeScale(1.0, heightScale)
            transform = CGAffineTransform(scaleX: 1.0, y: heightScale)
            center = c
        }
    }
}

extension UIView
{
    func shake()
    {
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [ 0, 10, -10, 10, 0 ]
        animation.keyTimes = [NSNumber(value: 0.0), NSNumber(value: 1.0 / 6.0), NSNumber(value: 3.0 / 6.0), NSNumber(value: 5.0 / 6.0), NSNumber(value: 1.0)]
        animation.duration = 0.4;
        animation.isAdditive = true
        
        layer.add(animation, forKey: "shake")
    }
}


extension Float
{
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}


public extension LazyMapCollection
{
    
    func toArray() -> [Element]{
        return Array(self)
    }
}



