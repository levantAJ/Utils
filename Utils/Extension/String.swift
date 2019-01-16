//
//  String.swift
//  Utils
//
//  Created by Le Tai on 10/15/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

extension String {
    public func sizeWithFont(font: UIFont, forWidth width: CGFloat, completion: @escaping (CGSize) -> Void) {
        DispatchQueue(label: "com.levantAJ.Utils", qos: .default, attributes: .concurrent).async {
            let fString = self as NSString
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
            let attrDict = [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ]
            let maximumSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
            let rect = fString.boundingRect(with: maximumSize,
                                            options: [.truncatesLastVisibleLine, .usesLineFragmentOrigin],
                attributes: attrDict,
                context: nil)
            DispatchQueue.main.async {
                completion(rect.size)
            }
        }
    }
    
    public func sizeWithFont(font: UIFont, forWidth width: CGFloat) -> CGSize {
        let fString = self as NSString
        let maximumSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let rect = fString.boundingRect(with: maximumSize,
                                        options: NSStringDrawingOptions.truncatesLastVisibleLine.union(NSStringDrawingOptions.usesLineFragmentOrigin),
            attributes: [NSAttributedString.Key.font: font],
            context: nil)
        return rect.size
    }
    
    public func validateVietnamesePhoneNumber() -> Bool {
        let regexString = "[0]{1}([9]{1}[0-9]{8}|[1]{1}[0-9]{9})"
        let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray: [regexString])
        return predicate.evaluate(with: self)
    }
    
    public func validateEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    public func isEmptyOrContainsOnlySpaces() -> Bool {
        return trimmingCharacters(in: .whitespaces).count == 0
    }
    
    public func tryParseInt() -> Bool {
        if Int(self) != nil {
            return true
        }
        return false
    }
    
    public func removeUnicode() -> String {

        var standard = replacingOccurrences(of: "đ", with: "d")
        standard = standard.replacingOccurrences(of: "Đ", with: "d")
        let decode = standard.data(using: String.Encoding.ascii, allowLossyConversion: true)
        standard = String(data: decode!, encoding: String.Encoding.ascii)!
        return standard.addingPercentEncoding(withAllowedCharacters: .nonBaseCharacters)!
    }
    
    public func toJSON() -> AnyObject? {
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        guard let jsonData = data else { return nil }
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers)
            return jsonResult as AnyObject
        } catch {
            return nil
        }
    }
    
    public static func formatWithThousandSeparator(number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.formatterBehavior = .behavior10_4
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number))!
    }
    
    public static func formatWithThousandSeparator(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.formatterBehavior = .behavior10_4
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:
            number))!
    }
    
    public func isEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
