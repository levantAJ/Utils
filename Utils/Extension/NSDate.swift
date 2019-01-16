//
//  NSDate.swift
//  Utils
//
//  Created by Le Tai on 1/22/16.
//  Copyright © 2016 AJ. All rights reserved.
//

import UIKit

public extension Date {
    public func toFullString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
    
    public func toString(dateFormat: String = "dd/MM/yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
    public static func fromString(dateString: String, dateFormat: String = "dd/MM/yyyy") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: dateString)
    }
}
