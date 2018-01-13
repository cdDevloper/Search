//
//  textField.swift
//  MalaBes
//
//  Created by PUNDSK006 on 4/26/17.
//  Copyright © 2017 Intechcreative Pvt. Ltt. All rights reserved.
//

import Foundation
import UIKit

extension UITextField
{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set
        {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
    
    func setTintAndTextColor()
    {
        self.tintColor = Color.txtFieldTintColor
        self.textColor = Color.txtColor;
    }
    
    
    func setLeftIcon(_ icon1: String) {
        
        let icon = UIImage(named: icon1)
        let padding = 8
        let size = 20
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = icon
        outerView.addSubview(iconView)
        leftView = outerView
        leftViewMode = .always
        
        self.spellCheckingType = UITextSpellCheckingType.no
        self.autocorrectionType = UITextAutocorrectionType.no
        //self.tintColor = color.txtFieldTintColor
        self.textColor = Color.txtColor;
        self.rightViewMode = UITextFieldViewMode.always
        self.clearButtonMode = .whileEditing
    }
    
    func setLeftSpace()
    {
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width:20, height: 20))
        leftView = outerView
        leftViewMode = .always
        
        self.spellCheckingType = UITextSpellCheckingType.no
        self.autocorrectionType = UITextAutocorrectionType.no
        self.tintColor = Color.txtFieldTintColor
        self.textColor = Color.txtColor;
        self.rightViewMode = UITextFieldViewMode.always
        self.clearButtonMode = .whileEditing
    }
    
}

extension String
{
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat
    {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    
    
    func widthOfString(usingFont font: UIFont) -> CGFloat
    {
        let fontAttributes = [NSFontAttributeName: font]
        let size = self.size(attributes: fontAttributes)
        return size.width
    }
    
    func strstr(needle: String, beforeNeedle: Bool = false) -> String? {
        guard let range = self.range(of: needle) else { return nil }
        
        if beforeNeedle {
            return self.substring(to: range.lowerBound)
        }
        
        return self.substring(from: range.upperBound)
    }
    
}
