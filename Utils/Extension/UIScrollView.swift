//
//  UIScrollView.swift
//  PinBike
//
//  Created by Le Tai on 10/30/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import UIKit

extension UIScrollView {
    public func scrollToBottom() {
        let bottomRect = CGRect(x: self.contentSize.width - 1, y: self.contentSize.height - 1, width: 1, height: 1)
        self.scrollRectToVisible(bottomRect, animated: true)
    }
    
    public var isBouncing: Bool {
        return contentOffset.y >= contentSize.height - bounds.size.height || contentOffset.y <= 0
    }
}
