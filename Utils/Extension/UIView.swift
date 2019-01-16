//
//  UIView.swift
//  CloudBike
//
//  Created by Le Tai on 7/28/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import UIKit

public extension UIView {
    public class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: nibNamed, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    public func addRadius(radius: CGFloat = 5) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    public func addCircle() {
        layer.cornerRadius = frame.width/2
        clipsToBounds = true
    }
    
    public func addBorder(borderWidth: CGFloat = 0.5, borderColor: UIColor = .gray) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
        
    public func roundCorners(top: Bool = true,
        bottom: Bool = true,
        left: Bool = true,
        right: Bool = true,
        radius: CGFloat = 5) {
            let size = CGSize(width: radius, height: radius)
        var path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: size)
            if top && bottom {
                if left && right {
                    path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: size)
                } else if left {
                    path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: size)
                } else if right {
                    path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: size)
                }
            } else if top {
                if left && right {
                    path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: size)
                } else if left {
                    path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .topLeft, cornerRadii: size)
                } else {
                    path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .topRight, cornerRadii: size)
                }
            } else {
                if left && right {
                    path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: size)
                } else if left {
                    path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .bottomLeft, cornerRadii: size)
                } else {
                    path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .bottomRight, cornerRadii: size)
                }
            }
            let mask = CAShapeLayer()
        mask.path = path.cgPath
            self.layer.mask = mask
    }
    
    public func addShadow(size: CGSize = CGSize(width: 0, height: 0.5), shadowOpacity: Float = 0.1) {
        self.layer.shadowOffset = size
        self.layer.shadowOpacity = shadowOpacity
    }
    
    public func removeShadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.0
    }
    
    public class func dotView(size: CGFloat = 6, backgroundColor: UIColor = .lightGray) -> UIView {
        let dotView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        dotView.backgroundColor = backgroundColor
        dotView.addRadius(radius: size / 2)
        return dotView
    }
    
    public func hideBorder(hidden: Bool = true) {
        if hidden {
            layer.borderColor = UIColor.clear.cgColor
        } else {
            layer.borderColor = UIColor.white.cgColor
        }
    }
    
    public func captureImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func makeCircle() {
        addRadius(radius: frame.width/2)
    }
    
    public class func identifier() -> String {
        return description().components(separatedBy: ".").last!
    }
    
    public class func nib(bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: identifier(), bundle: bundle)
    }
}
