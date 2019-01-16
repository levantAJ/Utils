//
//  UIViewController.swift
//  Utils
//
//  Created by Le Tai on 12/12/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func showAlert(title: String, message: String, action: (() -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""),
                                        style: .default,
                                        handler: { (alertAction) -> Void in
                                            action?()
        }))
        present(alertVC, animated: true, completion: nil)
    }
    
    public func showConfirmAlert(title: String,
                                 message: String,
                                 actionTitle: String = NSLocalizedString("OK", comment: ""),
                                 cancelTitle: String = NSLocalizedString("Cancel", comment: ""),
                                 type: UIAlertController.Style = .actionSheet,
                                 confirmAction: @escaping () -> Void,
                                 cancelAction: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: type)
        alertController.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action) -> Void in
            cancelAction?()
        }))
        alertController.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: { (action) -> Void in
            confirmAction()
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    public func showDateTimePicker(title: String,
                                   message: String,
                                   date: Date,
                                   datePickerMode: UIDatePicker.Mode = UIDatePicker.Mode.dateAndTime,
                                   disablePrivousDate: Bool = true,
                                   disableFutureDate: Bool = false,
                                   selectedButtonTitle: String? = nil,
                                   commpletion: @escaping (Date) -> Void) {
        let alertController = UIAlertController(title: title,
                                                message: message + "\n\n\n\n\n\n\n\n\n\n\n",
                                                preferredStyle: .actionSheet)

        let dateTimePicker = UIDatePicker(frame: CGRect(x: 10, y: 50, width: view.bounds.width - 50, height: 200))
        alertController.view.addSubview(dateTimePicker)
        dateTimePicker.date = date
        dateTimePicker.datePickerMode = datePickerMode
        if disablePrivousDate {
            dateTimePicker.minimumDate = Date()
        }
        if disableFutureDate {
            dateTimePicker.maximumDate = Date()
        }
        dateTimePicker.center = CGPoint(x: alertController.view.bounds.width/2,
                                        y: dateTimePicker.center.y)
        if let selectedButtonTitle = selectedButtonTitle {
            alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: UIAlertAction.Style.cancel, handler: { (cancelAction) -> Void in }))
            alertController.addAction(UIAlertAction(title: selectedButtonTitle, style: UIAlertAction.Style.default, handler: { (cancelAction) -> Void in
                commpletion(dateTimePicker.date)
            }))
        } else {
            alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertAction.Style.cancel, handler: { (cancelAction) -> Void in
                commpletion(dateTimePicker.date)
            }))
        }
        present(alertController, animated: true, completion: nil)
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
        return UIApplication.shared.statusBarFrame.height
    }
    
    public func showAlertChangeProfileAvatar(selectPhoto: @escaping () -> Void, takePhoto: @escaping () -> Void) {
        let alertViewController = UIAlertController(title: NSLocalizedString("Change your avatar", comment: ""),
                                                    message: NSLocalizedString("Select your photo", comment: ""),
                                                    preferredStyle: .actionSheet)
        alertViewController.addAction(UIAlertAction(title: NSLocalizedString("Select a photo from library", comment: ""),
                                                    style: .default, handler: { (selectAction) -> Void in
                                                        selectPhoto()
        }))
        alertViewController.addAction(UIAlertAction(title: NSLocalizedString("Capture a photo", comment: ""),
                                                    style: .default, handler: { (captureAction) -> Void in
                                                        takePhoto()
        }))
        alertViewController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""),
                                                    style: .cancel, handler: { (captureAction) -> Void in

        }))
        present(alertViewController, animated: true, completion: nil)
    }
}
