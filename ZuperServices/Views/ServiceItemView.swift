//
//  ServiceItemView.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import SwiftUI
import ServicesSampleData

struct ServiceItemView: View {
    
    // MARK: - PROPERTIES
    
    let service: Service
    
    // MARK: - BODY
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HeaderSectionView
            
            InfoSectionView
            
            FooterSectionView
        }
        .padding(12)
        .background(.secondary, in: .rect(cornerRadius: 12).stroke(lineWidth: 1))
        .contentShape(.rect(cornerRadius: 12))
        
    }
}

// Tag: - #Extension: Private extension for UI components.
private extension ServiceItemView {
    
    func PriorityIndicator(_ priority: Priority) -> some View {
        Circle()
            .fill(priority.color)
            .frame(width: 10, height: 10)
    }
    
    func ServiceInfo(image: ImageResource, description: String) -> some View {
        HStack(alignment: .center) {
            Image(image)
                .renderingMode(.template)
                .foregroundStyle(.blue)
            
            Text(description)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var HeaderSectionView: some View {
        HStack(alignment: .center) {
            Text(service.title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            PriorityIndicator(service.priority)
        }
    }
    
    var InfoSectionView: some View {
        VStack(alignment: .leading, spacing: 8) {
            ServiceInfo(image: .user, description: service.customerName)
            
            ServiceInfo(image: .description, description: service.description)
        }
    }
    
    var FooterSectionView: some View {
        HStack(alignment: .center) {
            StatusItemView(status: service.status)
            
            Spacer()
            
            if let date: Date = service.scheduledDate.ISOdateFormatted {
                Text(date.formattedDate)
            }
        }
        .font(.caption)
    }
    
}

// MARK: - PREVIEW

#Preview {
    let service = SampleData.generateSingleService()
    
    ServiceItemView(service: service)
        .padding()
}
