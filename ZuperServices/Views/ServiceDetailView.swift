//
//  ServiceDetailView.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import SwiftUI
import ServicesSampleData

struct ServiceDetailView: View {
    
    // MARK: - PROPERTIES
    
    let service: Service
    
    // MARK: - BODY
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 16) {
                HeaderSectionView
                
                SectionItemView(image: .user, title: "Customer", description: service.customerName)
                
                SectionItemView(image: .description, title: "Description", description: service.description)
                
                if let date = service.scheduledDate.ISOdateFormatted {
                    SectionItemView(image: .clock, title: "Scheduled Time", description: date.formattedDate)
                }
                
                SectionItemView(image: .pin, title: "Location", description: service.location)
                
                SectionItemView(image: .message, title: "Service Notes", description: service.serviceNotes)
            }
            .padding()
        }
//        .scrollBounceBehaviorBasedOnSize()
        .navigationTitle("Service Detail")
        
    }
}

private extension ServiceDetailView {
    
    var TitleView: some View {
        Text(service.title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var HeaderSectionView: some View {
        HStack(alignment: .firstTextBaseline) {
            TitleView
            
            StatusItemView(status: service.status, size: 16)
                .font(.footnote)
        }
    }
    
    func SectionItemView(image: ImageResource, title: String, description: String) -> some View {
        HStack(alignment: .top) {
            Image(image)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}

extension View {
    
    @ViewBuilder
    func scrollBounceBehaviorBasedOnSize() -> some View {
        if #available(iOS 16.4, *) {
            scrollBounceBehavior(.basedOnSize)
        }
    }
    
}

// MARK: - PREVIEW

#Preview {
    let service = SampleData.generateSingleService()
    
    NavigationStack {
        ServiceDetailView(service: service)
    }
}
