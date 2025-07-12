//
//  String + Extensions.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import Foundation

extension String {
    
    var ISOdateFormatted: Date? {
        let formatter = ISO8601DateFormatter()

        return formatter.date(from: self)
    }
    
}
