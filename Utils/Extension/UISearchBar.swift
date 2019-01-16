//
//  UISearchBar.swift
//  CloudBike
//
//  Created by Le Tai on 7/19/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import UIKit

public extension UISearchBar {
    public func setTextColor(color: UIColor) {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = color
    }
    
    public func setPlaceholder(placeholder: String, textColor: UIColor) {
        for subView in self.subviews  {
            for subsubView in subView.subviews  {
                if let textField = subsubView as? UITextField {
                    textField.attributedPlaceholder =  NSAttributedString(string:placeholder,
                                                                          attributes:[NSAttributedString.Key.foregroundColor: textColor])
                }
            }
        }
    }
    
    public func setPlaceholderTextColor(color: UIColor) {
        for subView in self.subviews  {
            for subsubView in subView.subviews  {
                if let textField = subsubView as? UITextField {
                    textField.attributedPlaceholder =  NSAttributedString(string:self.placeholder!,
                                                                          attributes:[NSAttributedString.Key.foregroundColor: color])
                }
            }
        }
    }
    
    public func setTextBackgroundColor(color: UIColor) {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = color
    }
    
    public func enableSearchBar(enabled: Bool = true) {
        if let wrapperView = subviews.first {
            for view in wrapperView.subviews {
                if let control = view as? UIControl {
                    control.isEnabled = enabled
                    control.isUserInteractionEnabled = true
                }
            }
        }
    }
}
