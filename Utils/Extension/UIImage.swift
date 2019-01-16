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
        guard let url = URL(string: urlString),
            let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }
    
    public class func imageFromUrlString(urlString: String, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue(label: Constants.UIImage.QueueLabel, qos: .default, attributes: .concurrent).async {
            if let url = URL(string: urlString),
                let data = try? Data(contentsOf: url) {
                    completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }
    }
    
    public class func imageFromUrl(url: URL) -> UIImage? {
        guard let data = try? Data(contentsOf: url) else { return nil }
        return UIImage(data: data)
    }
    
    public class func imageFromUrl(url: URL?, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue(label: Constants.UIImage.QueueLabel, qos: .default, attributes: .concurrent).async {
            if let url = url,
                let data = try? Data(contentsOf: url) {
                completion(UIImage(data: data))
            } else {
                completion(nil)
            }
        }
    }
    
    public func imageToSize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(in: CGRect(origin: .zero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!
    }
    
    public class func imageFromColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension Constants {
    struct  UIImage {
        static let QueueLabel = "com.pinbike.uiimage.queue"
    }
}
