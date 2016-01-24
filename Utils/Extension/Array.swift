//
//  Array.swift
//  Utils
//
//  Created by Le Tai on 1/24/16.
//  Copyright © 2016 AJ. All rights reserved.
//

import UIKit

public extension Array {
    public func takeElements(var elementCount: Int) -> Array {
        if (elementCount > count) {
            elementCount = count
        }
        if elementCount < 0 {
            elementCount = 0
        }
        return Array(self[0..<elementCount])
    }
}
