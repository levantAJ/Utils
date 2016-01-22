//
//  NSDate.swift
//  Utils
//
//  Created by Le Tai on 1/22/16.
//  Copyright © 2016 AJ. All rights reserved.
//

import UIKit

public extension NSDate {
    public func toFullString() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yyyy"
        return dateFormatter.stringFromDate(self)
    }
    
    public func toString(dateFormat: String = "dd/MM/yyyy") -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.stringFromDate(self)
    }
    
    public class func fromString(dateString: String, dateFormat: String = "dd/MM/yyyy") -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.dateFromString(dateString)
    }
}
