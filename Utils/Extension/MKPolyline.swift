//
//  MKPolyline.swift
//  CloudBike
//
//  Created by Le Tai on 7/30/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import MapKit

public extension MKPolyline {
    public func getCoordinates() -> [CLLocationCoordinate2D] {
        let coordsPointer = UnsafeMutablePointer<CLLocationCoordinate2D>.alloc(pointCount)
        getCoordinates(coordsPointer, range: NSMakeRange(0, pointCount))
        var coords: [CLLocationCoordinate2D] = []
        for i in 0..<pointCount {
            coords.append(coordsPointer[i])
        }
        coordsPointer.dealloc(pointCount)
        return coords
    }
    
    public func renderMapImage(mapImageSize: CGSize,
        startCoordinate: CLLocationCoordinate2D,
        endCoordinate: CLLocationCoordinate2D,
        completion: (UIImage) -> Void) {
            MKMapSnapshotter.takeSnapShotOfTargetSize(mapImageSize,
                polyline: self,
                startCoordinate: startCoordinate,
                endCoordinate: endCoordinate,
                completion: { (image) -> Void in
                    completion(image)
            })
    }
}
