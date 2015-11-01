//
//  NSNotification.swift
//  Utils
//
//  Created by Le Tai on 11/1/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

extension NSNotification {
    public func sizeForKeyboard() -> CGSize {
        let keyboardSize = userInfo![UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        return CGSize(width: max(keyboardSize.height, keyboardSize.width), height: min(keyboardSize.height, keyboardSize.width))
    }
}
