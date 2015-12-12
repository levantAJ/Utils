//
//  UIViewController.swift
//  Utils
//
//  Created by Le Tai on 12/12/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func showAlert(title title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"),
            style: UIAlertActionStyle.Default,
            handler: { (alertAction) -> Void in }))
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
}
