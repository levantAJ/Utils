//
//  String.swift
//  Utils
//
//  Created by Le Tai on 10/15/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

extension String {
    public func sizeWithFont(font: UIFont, forWidth width: CGFloat, completion: (CGSize) -> Void) {
        dispatch_async(dispatch_queue_create("com.cloudbike.queue.string", DISPATCH_QUEUE_CONCURRENT)) { () -> Void in
            let fString = self as NSString
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
            let attrDict = [
                NSFontAttributeName: font,
                NSParagraphStyleAttributeName: paragraphStyle
            ]
            let maximumSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
            let rect = fString.boundingRectWithSize(maximumSize,
                options: [.TruncatesLastVisibleLine, .UsesLineFragmentOrigin],
                attributes: attrDict,
                context: nil)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(rect.size)
            })
        }
    }
    
    public func sizeWithFont(font: UIFont, forWidth width: CGFloat) -> CGSize {
        let fString = self as NSString
        let maximumSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let rect = fString.boundingRectWithSize(maximumSize,
            options: NSStringDrawingOptions.TruncatesLastVisibleLine.union(NSStringDrawingOptions.UsesLineFragmentOrigin),
            attributes: [NSFontAttributeName: font],
            context: nil)
        return rect.size
    }
    
    public func validateVietnamesePhoneNumber() -> Bool {
        let regexString = "[0]{1}([9]{1}[0-9]{8}|[1]{1}[0-9]{9})"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regexString])
        return predicate.evaluateWithObject(self)
    }
    
    public func validateEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
    
    public func isEmptyOrContainsOnlySpaces() -> Bool {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()).characters.count == 0
    }
}
