//
//  CLLocationCoordinate + Extensions.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import MapKit
import Foundation

extension CLLocationCoordinate2D {
    
    static func randomCoordinateInIndia() -> CLLocationCoordinate2D {
        let lat = Double.random(in: 8.0...37.0)
        let lon = Double.random(in: 68.0...97.0)
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
    
}
