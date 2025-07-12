//
//  Priority + Extensions.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import SwiftUI
import ServicesSampleData

extension Priority {
    
    var color: Color {
        switch self {
        case .low: .green
        case .medium: .yellow
        case .high: .orange
        case .critical: .red
        }
    }
    
}
