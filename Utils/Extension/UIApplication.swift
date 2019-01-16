//
//  UIApplication.swift
//  Utils
//
//  Created by Le Tai on 1/9/16.
//  Copyright © 2016 AJ. All rights reserved.
//

public extension UIApplication {
    public class func callPhoneNumber(phoneNumber: String) {
        guard let phoneURL = URL(string: "telprompt://\(phoneNumber)"),
            shared.canOpenURL(phoneURL)  else { return }
        shared.openURL(phoneURL)
    }
    
    public class func canCallPhoneNumber(phoneNumber: String) -> Bool {
        guard let phoneURL = URL(string: "telprompt://\(phoneNumber)")  else { return false }
        return shared.canOpenURL(phoneURL)
    }
}
