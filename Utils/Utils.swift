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
        guard UIDevice.current.userInterfaceIdiom == .phone && UIScreen.main.bounds.size.height < 568 else {
            return false
        }
        return true
    }
    
    public static var deviceLowerThanOrEqualIPhone5s: Bool {
        guard UIDevice.current.userInterfaceIdiom == .phone && UIScreen.main.bounds.size.height <= 568 else {
            return false
        }
        return true
    }
    
    public class func dataFromStringsArray(strings: [String]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: strings) as NSData
    }
    
    public class func stringsArrayFromData(data: NSData) -> [String]? {
        guard let strings = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as? [String] else { return nil }
        return strings
    }
    
    public class func viewController(screenName: String, storyboardName: String, bundle: Bundle? = nil) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: screenName)
    }
    
    public class func statusBarHeight() -> CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    public class func appName() -> String {
        guard let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String else { return "" }
        return appName
    }
    
    public class func screenSize() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    public class func removeItemAtPathIfExists(path: String) throws {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            do {
                try fileManager.removeItem(atPath: path)
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
                NotificationCenter.default.addObserver(observer,
                    selector: didShowSelector,
                    name: UIResponder.keyboardDidShowNotification,
                    object: nil)
            }
            if let didHideSelector = didHideSelector {
                NotificationCenter.default.addObserver(observer,
                    selector: didHideSelector,
                    name: UIResponder.keyboardDidHideNotification,
                    object: nil)
            }
            if let willShowSelector = willShowSelector {
                NotificationCenter.default.addObserver(observer,
                    selector: willShowSelector,
                    name: UIResponder.keyboardWillShowNotification,
                    object: nil)
            }
            if let willHideSelector = willHideSelector {
                NotificationCenter.default.addObserver(observer,
                    selector: willHideSelector,
                    name: UIResponder.keyboardWillHideNotification,
                    object: nil)
            }
    }
}
