//
//  String.swift
//  Utils
//
//  Created by Le Tai on 10/15/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

extension String {
    public func sizeWithFont(font: UIFont, forWidth width: CGFloat) -> CGSize {
        let fString = self as NSString
        let maximumSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let rect = fString.boundingRectWithSize(maximumSize,
            options: NSStringDrawingOptions.TruncatesLastVisibleLine.union(NSStringDrawingOptions.UsesLineFragmentOrigin),
            attributes: [NSFontAttributeName: font],
            context: nil)
        return rect.size
    }
}
