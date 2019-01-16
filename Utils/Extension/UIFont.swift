//
//  UIFont.swift
//  Utils
//
//  Created by Le Tai on 12/9/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

public extension UIFont {
    public class func mediumFontWithSize(size: CGFloat) -> UIFont? {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .medium)
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    public class func regularFontWithSize(size: CGFloat) -> UIFont? {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    public class func semiboldFontWithSize(size: CGFloat) -> UIFont? {
        if #available(iOS 8.2, *) {
            return UIFont.systemFont(ofSize: size, weight: .semibold)
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
