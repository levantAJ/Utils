//
//  CLLocationCoordinate2D.swift
//  CloudBike
//
//  Created by Le Tai on 9/25/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import CoreLocation

public extension CLLocationCoordinate2D {
    public var isZero: Bool {
        return latitude == 0 && longitude == 0
    }
    
    public func kmDistanceTo(coordinate: CLLocationCoordinate2D) -> Double {
        let dlon = deg2rad(longitude - coordinate.longitude)
        let dlat = deg2rad(latitude - coordinate.latitude)
        let a = (pow(sinf(dlat / 2), 2) + cosf(deg2rad(latitude))) * cosf(deg2rad(coordinate.latitude)) * pow(sinf(dlon / 2), 2)
        let angle = 2 * asin(sqrt(a))
        return Double(angle) * 6371
    }
    
    private func deg2rad(deg: Double) -> Float {
        return Float(deg * (M_PI/180))
    }
}
