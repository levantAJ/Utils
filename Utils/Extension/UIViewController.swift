//
//  UIViewController.swift
//  Utils
//
//  Created by Le Tai on 12/12/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func showAlert(title title: String, message: String, action: (() -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertVC.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK"),
            style: UIAlertActionStyle.Default,
            handler: { (alertAction) -> Void in
                action?()
        }))
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    public func showConfirmAlert(title: String, message: String, actionTitle: String = "OK", confirmAction: () -> Void, cancelAction: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .Cancel, handler: { (action) -> Void in
            cancelAction?()
        }))
        alertController.addAction(UIAlertAction(title: actionTitle, style: .Destructive, handler: { (action) -> Void in
            confirmAction()
        }))
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    public func tabBarHeight() -> CGFloat {
        guard let height = tabBarController?.tabBar.frame.height else { return 0 }
        return height
    }
    
    public func navigationBarHeight() -> CGFloat {
        guard let height = navigationController?.navigationBar.frame.height else { return 0 }
        return height
    }
}
