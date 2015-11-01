//
//  String.swift
//  Utils
//
//  Created by Le Tai on 10/15/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

extension String {
    public func sizeWithFont(font: UIFont, forWidth width: CGFloat) -> CGSize {
        let fString = self as NSString
        let maximumSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let rect = fString.boundingRectWithSize(maximumSize,
            options: NSStringDrawingOptions.TruncatesLastVisibleLine.union(NSStringDrawingOptions.UsesLineFragmentOrigin),
            attributes: [NSFontAttributeName: font],
            context: nil)
        return rect.size
    }
    
    public func validatePhoneNumber() -> Bool {
        let regexString = "[0]{1}([9]{1}[0-9]{8}|[1]{1}[0-9]{9})"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regexString])
        return predicate.evaluateWithObject(self)
    }
    
    public func validateEmail(testStr:String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
}
