//
//  Location.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import MapKit
import Foundation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
