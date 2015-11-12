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
}
