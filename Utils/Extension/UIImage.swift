//
//  UIImage.swift
//  CloudBike
//
//  Created by Le Tai on 7/20/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import UIKit

public extension UIImage {
    public class func imageFromUrlString(urlString: String) -> UIImage? {
        guard let url = NSURL(string: urlString), data = NSData(contentsOfURL: url) else { return nil }
        return UIImage(data: data)
    }
    
    public class func imageFromUrlString(urlString: String, completion: (UIImage?) -> Void) {
        dispatch_async(dispatch_queue_create(Constants.UIImage.QueueLabel, DISPATCH_QUEUE_CONCURRENT)) { () -> Void in
            if let url = NSURL(string: urlString),
                data = NSData(contentsOfURL: url) {
                    completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }
    }
    
    public class func imageFromUrl(url: NSURL) -> UIImage? {
        guard let data = NSData(contentsOfURL: url) else { return nil }
        return UIImage(data: data)
    }
    
    public class func imageFromUrl(url: NSURL?, completion: (UIImage?) -> Void) {
        dispatch_async(dispatch_queue_create(Constants.UIImage.QueueLabel, DISPATCH_QUEUE_CONCURRENT)) { () -> Void in
            if let url = url, data = NSData(contentsOfURL: url) {
                completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }
    }
    
    public func imageToSize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        drawInRect(CGRect(origin: CGPointZero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }
    
    public class func imageFromColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, size.width, size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension Constants {
    struct  UIImage {
        static let QueueLabel = "com.pinbike.uiimage.queue"
    }
}
