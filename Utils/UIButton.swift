//
//  Button.swift
//  Utils
//
//  Created by Le Tai on 10/20/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

extension UIButton {
    
    public func sizeToFitsTitleAndImage(horizontalPadding: CGFloat = 5) {
        var width = 2*horizontalPadding
        if let titleLabel = titleLabel {
            titleLabel.sizeToFit()
            width += titleLabel.frame.width
        }
        if let imageView = imageView {
            width += imageView.frame.width
        }
        frame = CGRect(origin: frame.origin, size: CGSize(width: width, height: frame.height))
    }
    
}
