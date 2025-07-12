//
//  StatusItemView.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import SwiftUI
import ServicesSampleData

struct StatusItemView: View {
    
    // MARK: - PROPERTIES
    
    let status: ServiceStatus
    var size: CGFloat = 12
    
    // MARK: - BODY
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 4) {
            RoundedRectangle(cornerRadius: 4)
                .opacity(0.3)
                .frame(width: size, height: size)
            
            Text(status.rawValue)
        }
        .foregroundStyle(status.color)
        .padding(.vertical, 6)
        .padding(.horizontal, 8)
        .background(status.color.opacity(0.3), in: .capsule)
        .overlay(status.color, in: .capsule.stroke(lineWidth: 0.5))
        
    }
}

#Preview {
    StatusItemView(status: .inProgress)
}
