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
            return UIFont.systemFontOfSize(size, weight: UIFontWeightMedium)
        } else {
            return UIFont(name: "HelveticaNeue-Medium", size: size)
        }
    }
    
    public class func regularFontWithSize(size: CGFloat) -> UIFont? {
        if #available(iOS 8.2, *) {
            return UIFont.systemFontOfSize(size, weight: UIFontWeightRegular)
        } else {
            return UIFont(name: "HelveticaNeue-Regular", size: size)
        }
    }
    
    public class func semiboldFontWithSize(size: CGFloat) -> UIFont? {
        if #available(iOS 8.2, *) {
            return UIFont.systemFontOfSize(size, weight: UIFontWeightSemibold)
        } else {
            return UIFont(name: "HelveticaNeue-Semibold", size: size)
        }
    }
}
