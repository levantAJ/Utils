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
        region.span = MKCoordinateSpanMake(0.01, 0.01);
        setRegion(region, animated: true)
    }
    
    public func removeAllAnnotations() {
        removeAnnotations(annotations)
    }
}


