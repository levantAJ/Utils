//
//  Dictionary.swift
//  CloudBike
//
//  Created by Le Tai on 7/19/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

public extension Dictionary {
    public func valueAtIndex(index: Int) -> AnyObject? {
        for (idx, item) in self.enumerated() {
            if index == idx {
                return item.1 as? AnyObject
            }
        }
        return nil
    }
    
    public func keyAtIndex(index: Int) -> String? {
        for (idx, item) in self.enumerated() {
            if index == idx {
                return item.0 as? String
            }
        }
        return nil
    }
}
