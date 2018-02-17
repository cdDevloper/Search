//
//  Validation.swift
//  MalaBes
//
//  Created by PUNDSK006 on 5/12/17.
//  Copyright © 2017 Intechcreative Pvt. Ltt. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

class Validation1
{
    class func isValidEmail(testEmail:String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
       
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testEmail)
        
    }
    
    class func isValidPhone(testPhoneNumber: String) -> Bool
    {
        let phoneRegex = "^((\\+))[0-9]{6,14}$"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegex)
        
        return phoneTest.evaluate(with: testPhoneNumber)
    }
    
    class func isValidString(testStr: String)-> Bool
    {
        do
        {
            let regex = try NSRegularExpression(pattern: "^[0-9a-zA-Z\\_]{7,18}$", options: .caseInsensitive)
            if regex.matches(in: testStr, options: [], range: NSMakeRange(0, testStr.characters.count)).count > 0
            {return true
            }
        }
        catch
        {
        }
        return false
        
    }
    
    class func checkNotNullParameter(checkStr: String) -> Bool
    {
        
        if  checkStr.isEmpty || checkStr == "<NULL>" || checkStr == "(null)" || checkStr == "" || checkStr == "<null>"
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    
    class func checkNotNullString(checkStr: String) -> Bool
    {
        
        if  checkStr.isEmpty || checkStr == "<NULL>" || checkStr == "(null)" || checkStr == "" || checkStr == "<null>"
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    class func isValidatePhone(phoneNumber: String) -> Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = phoneNumber.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  phoneNumber == filtered
    }
    
    class func isConnectedToNetwork() -> Bool
    {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    class func checkWhiteSpace(str : String) -> Bool
    {
        let whitespaceSet = CharacterSet.whitespaces
        if str.trimmingCharacters(in: whitespaceSet).isEmpty
        {
            // string contains non-whitespace characters
            return true
        }
        else
        {
            return false
        }
    }
    
    class func isOnlyAplphabets(str : String) -> Bool
    {
        let characterSet = CharacterSet.letters
        
        if str.rangeOfCharacter(from: characterSet.inverted) != nil
        {
            return false
        }
        return true
    }
    
    class func isTxtFieldCrossLimit(text : String, range: NSRange, string: String) -> Bool
    {
        let nsString = NSString(string: text )
        let newText = nsString.replacingCharacters(in: range, with: string)
        return  newText.characters.count <= 255
    }
}
