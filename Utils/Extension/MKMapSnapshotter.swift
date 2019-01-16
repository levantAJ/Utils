//
//  MKMapSnapshotter.swift
//  CloudBike
//
//  Created by Le Tai on 7/29/15.
//  Copyright © 2015 Le Van Tai. All rights reserved.
//

import MapKit

public extension MKMapSnapshotter {
    
    public class func takeSnapShotOfTargetSize(size: CGSize,
                                               polyline: MKPolyline,
                                               startCoordinate: CLLocationCoordinate2D,
                                               endCoordinate: CLLocationCoordinate2D,
                                               lineColor: UIColor = .blue,
                                               completion: @escaping (UIImage) -> Void) {
        let options = MKMapSnapshotter.Options()
        options.scale = UIScreen.main.scale
        let paddingHeight: Double = 3000, paddingWidth: Double = 3000
        let mapOrigin = MKMapPoint(x: polyline.boundingMapRect.origin.x - paddingWidth / 2, y: polyline.boundingMapRect.origin.y - 1.5*paddingHeight)
        let mapSize = MKMapSize(width: polyline.boundingMapRect.size.width + 1.5*paddingWidth, height: polyline.boundingMapRect.size.height + 2*paddingHeight)
        options.mapRect = MKMapRect(origin: mapOrigin, size: mapSize)
        options.size = size

        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start { (snapshot, error) -> Void in
            if error == nil {
                completion(drawPolyline(polyline: polyline,
                                        onSnapshot: snapshot!,
                                        startCoordinate: startCoordinate,
                                        endCoordinate: endCoordinate,
                                        lineColor: lineColor))
            }
        }
    }
    
    public class func drawPolyline(polyline: MKPolyline,
                                   onSnapshot snapshot: MKMapSnapshotter.Snapshot,
                                   startCoordinate: CLLocationCoordinate2D,
                                   endCoordinate: CLLocationCoordinate2D,
                                   lineColor: UIColor = .blue,
                                   startPinImage: String = "ic_pin_start",
                                   endPinImage: String = "ic_pin_finish") -> UIImage {

        let startPin = MKAnnotationView(annotation: nil, reuseIdentifier: "")
        startPin.image = UIImage(named: startPinImage)
        let startPinImage = startPin.image
        let endPin = MKAnnotationView(annotation: nil, reuseIdentifier: "")
        endPin.image = UIImage(named: endPinImage)
        let endPinImage = endPin.image

        let coords = polyline.getCoordinates()
        let image = snapshot.image
        UIGraphicsBeginImageContextWithOptions(image.size, true, image.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        context?.scaleBy(x: 1, y: -1)
        context?.translateBy(x: 0, y: -image.size.height)
        let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        context?.draw(image.cgImage!, in: rect)
        context?.restoreGState()

        var points = [CGPoint]()
        var lastPoint: CGPoint = .zero
        let diagonal = sqrt(image.size.width * image.size.width + image.size.height * image.size.height)
        for (i, coord) in coords.enumerated() {
            var point = snapshot.point(for: coord)
            if point.x > image.size.width {
                var mirrorCoord = coord
                mirrorCoord.longitude = mirrorCoord.longitude * -1
                let mirrorPoint = snapshot.point(for: mirrorCoord)
                var flipCoord = coord
                flipCoord.longitude = -179.99999
                let flipPoint = snapshot.point(for: flipCoord)
                let flipDistance = mirrorPoint.x - flipPoint.x
                point = mirrorPoint
                point.x = flipPoint.x - flipDistance
            }
            if point.x < 0 {
                var mirrorCoord = coord
                mirrorCoord.longitude = mirrorCoord.longitude * -1
                let mirrorPoint = snapshot.point(for: mirrorCoord)
                var flipCoord = coord
                flipCoord.longitude = 179.99999
                let flipPoint = snapshot.point(for: flipCoord)
                let flipDistance = flipPoint.x - mirrorPoint.x
                point = mirrorPoint
                point.x = flipPoint.x + flipDistance
            }
            if i == 0 {
                points.append(point)
                lastPoint = point
            } else if sqrt((point.x - lastPoint.x) * (point.x - lastPoint.x) + (point.y - lastPoint.y) * (point.y - lastPoint.y)) > diagonal / 100 {
                points.append(point)
                lastPoint = point
            }
        }

        // Draw line (points in line)
        let origin = points[0]
        context?.move(to: origin)
        context?.setLineWidth(2)
        context?.setStrokeColor(lineColor.cgColor)
        for p in points {
            context?.addLine(to: p)
        }
        context?.strokePath()

        // Draw start and end
        let startPoint = snapshot.point(for: startCoordinate)
        startPinImage!.draw(at: CGPoint(x: startPoint.x,
                                        y: startPoint.y - startPin.bounds.height))
        let endPoint = snapshot.point(for: endCoordinate)
        endPinImage!.draw(at: CGPoint(x: endPoint.x,
                                      y: endPoint.y - endPin.bounds.height))
        
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return finalImage!
    }
}
