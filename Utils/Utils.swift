//
//  Utils.swift
//  Utils
//
//  Created by Le Tai on 11/3/15.
//  Copyright © 2015 AJ. All rights reserved.
//

import UIKit

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
}
