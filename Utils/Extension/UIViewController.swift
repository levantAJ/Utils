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
        alertVC.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""),
            style: UIAlertActionStyle.Default,
            handler: { (alertAction) -> Void in
                action?()
        }))
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    public func showConfirmAlert(title: String,
        message: String,
        actionTitle: String = NSLocalizedString("OK", comment: ""),
        cancelTitle: String = NSLocalizedString("Cancel", comment: ""),
        type: UIAlertControllerStyle = .ActionSheet,
        confirmAction: () -> Void,
        cancelAction: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: type)
        alertController.addAction(UIAlertAction(title: cancelTitle, style: .Cancel, handler: { (action) -> Void in
            cancelAction?()
        }))
        alertController.addAction(UIAlertAction(title: actionTitle, style: .Destructive, handler: { (action) -> Void in
            confirmAction()
        }))
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    public func showDateTimePicker(title: String,
        message: String,
        date: NSDate,
        datePickerMode: UIDatePickerMode = UIDatePickerMode.DateAndTime,
        disablePrivousDate: Bool = true,
        disableFutureDate: Bool = false,
        selectedButtonTitle: String? = nil,
        commpletion: (NSDate) -> Void) {
            let alertController = UIAlertController(title: title,
                message: message + "\n\n\n\n\n\n\n\n\n\n\n",
                preferredStyle: .ActionSheet)
            
            let dateTimePicker = UIDatePicker(frame: CGRect(x: 10, y: 50, width: view.bounds.width - 50, height: 200))
            alertController.view.addSubview(dateTimePicker)
            dateTimePicker.date = date
            dateTimePicker.datePickerMode = datePickerMode
            if disablePrivousDate {
                dateTimePicker.minimumDate = NSDate()
            }
            if disableFutureDate {
                dateTimePicker.maximumDate = NSDate()
            }
            dateTimePicker.center = CGPoint(x: alertController.view.bounds.width/2,
                y: dateTimePicker.center.y)
            if let selectedButtonTitle = selectedButtonTitle {
                alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: UIAlertActionStyle.Cancel, handler: { (cancelAction) -> Void in }))
                alertController.addAction(UIAlertAction(title: selectedButtonTitle, style: UIAlertActionStyle.Default, handler: { (cancelAction) -> Void in
                    commpletion(dateTimePicker.date)
                }))
            } else {
                alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertActionStyle.Cancel, handler: { (cancelAction) -> Void in
                    commpletion(dateTimePicker.date)
                }))
            }
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
    
    public func statusBarHeight() -> CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.height
    }
    
    public func showAlertChangeProfileAvatar(selectPhoto: () -> Void, takePhoto: () -> Void) {
        let alertViewController = UIAlertController(title: NSLocalizedString("Change your avatar", comment: ""),
            message: NSLocalizedString("Select your photo", comment: ""),
            preferredStyle: .ActionSheet)
        alertViewController.addAction(UIAlertAction(title: NSLocalizedString("Select a photo from library", comment: ""),
            style: .Default, handler: { (selectAction) -> Void in
                selectPhoto()
        }))
        alertViewController.addAction(UIAlertAction(title: NSLocalizedString("Capture a photo", comment: ""),
            style: .Default, handler: { (captureAction) -> Void in
                takePhoto()
        }))
        alertViewController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""),
            style: .Cancel, handler: { (captureAction) -> Void in
                
        }))
        presentViewController(alertViewController, animated: true, completion: nil)
    }
}
