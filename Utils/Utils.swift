//
//  Utils.swift
//  Utils
//
//  Created by Le Tai on 11/3/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

public typealias FailureClosure = (NSError?) -> ()

public class Utils {
    public static var deviceLowerThanOrEqualIPhone4: Bool {
        guard UIDevice.currentDevice().userInterfaceIdiom == .Phone && UIScreen.mainScreen().bounds.size.height < 568 else {
            return false
        }
        return true
    }
    
    public static var deviceLowerThanOrEqualIPhone5s: Bool {
        guard UIDevice.currentDevice().userInterfaceIdiom == .Phone && UIScreen.mainScreen().bounds.size.height <= 568 else {
            return false
        }
        return true
    }
    
    public class func dataFromStringsArray(strings: [String]) -> NSData {
        return NSKeyedArchiver.archivedDataWithRootObject(strings)
    }
    
    public class func stringsArrayFromData(data: NSData) -> [String]? {
        guard let strings = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [String] else { return nil }
        return strings
    }
    
    public class func viewController(screenName: String, storyboardName: String, bundle: NSBundle? = nil) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard.instantiateViewControllerWithIdentifier(screenName)
    }
    
    public class func statusBarHeight() -> CGFloat {
        return UIApplication.sharedApplication().statusBarFrame.height
    }
    
    public class func appName() -> String {
        guard let appName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleDisplayName") as? String else { return "" }
        return appName
    }
    
    public class func screenSize() -> CGSize {
        return UIScreen.mainScreen().bounds.size
    }
    
    public class func removeItemAtPathIfExists(path: String) throws {
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(path) {
            do {
                try fileManager.removeItemAtPath(path)
            } catch let error {
                print(error as NSError)
            }
        }
    }
    
    public class func addKeyboardObserver(observer: AnyObject, willShowSelector: Selector? = nil,
        didShowSelector: Selector? = nil,
        willHideSelector: Selector? = nil,
        didHideSelector: Selector? = nil) {
            if let didShowSelector = didShowSelector {
                NSNotificationCenter.defaultCenter().addObserver(observer,
                    selector: didShowSelector,
                    name: UIKeyboardDidShowNotification,
                    object: nil)
            }
            if let didHideSelector = didHideSelector {
                NSNotificationCenter.defaultCenter().addObserver(observer,
                    selector: didHideSelector,
                    name: UIKeyboardDidHideNotification,
                    object: nil)
            }
            if let willShowSelector = willShowSelector {
                NSNotificationCenter.defaultCenter().addObserver(observer,
                    selector: willShowSelector,
                    name: UIKeyboardWillShowNotification,
                    object: nil)
            }
            if let willHideSelector = willHideSelector {
                NSNotificationCenter.defaultCenter().addObserver(observer,
                    selector: willHideSelector,
                    name: UIKeyboardWillHideNotification,
                    object: nil)
            }
    }
}
