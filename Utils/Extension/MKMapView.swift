//
//  MapView.swift
//  CloudBike
//
//  Created by Le Tai on 7/15/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import MapKit

public extension MKMapView {
    public func gotoLocation(coordinate: CLLocationCoordinate2D) {
        var region = MKCoordinateRegion()
        region.center = coordinate;
        region.span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01);
        setRegion(region, animated: true)
    }
    
    public func removeAllAnnotations() {
        removeAnnotations(annotations)
    }
    
    public func topLeftCoordinate() -> CLLocationCoordinate2D {
        return convert(CGPoint.zero, toCoordinateFrom: self)
    }
    
    public func bottomRightCoordinate() -> CLLocationCoordinate2D {
        return convert(CGPoint(x: frame.width, y: frame.height), toCoordinateFrom: self)
    }
}


