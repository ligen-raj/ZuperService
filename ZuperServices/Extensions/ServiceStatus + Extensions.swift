//
//  ServiceStatus + Extensions.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import SwiftUI
import ServicesSampleData

extension ServiceStatus {
    
    var color: Color {
        switch self {
        case .active: .blue
        case .scheduled: .teal
        case .completed: .green
        case .inProgress: .orange
        case .urgent: .red
        }
    }
    
}
