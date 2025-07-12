//
//  ServiceDetailView.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import MapKit
import SwiftUI
import ServicesSampleData

struct ServiceDetailView: View {
    
    // MARK: - PROPERTIES
    
    private let service: Service
    private let span: MKCoordinateSpan
    private let coordinate: CLLocationCoordinate2D
    
    private var location: Location {
        Location(name: service.location, coordinate: coordinate)
    }
    
    init(service: Service) {
        self.service = service
        let randomSpan: CLLocationDegrees = .random(in: 0.5...0.7)
        
//        coordinate = CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275) // London
        coordinate = .randomCoordinateInIndia()
        span = MKCoordinateSpan(latitudeDelta: randomSpan, longitudeDelta: randomSpan)
    }
    
    // MARK: - BODY
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 16) {
                MapSectionView
                
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
    
    @ViewBuilder
    var MapSectionView: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: span)), annotationItems: [location], annotationContent: { location in
            MapMarker(coordinate: location.coordinate, tint: .green)
        })
        .frame(height: 200)
        .clipShape(.rect(cornerRadius: 16))
        .overlay(.secondary, in: .rect(cornerRadius: 16).stroke())
    }
    
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

// MARK: - PREVIEW

#Preview {
    let service = SampleData.generateSingleService()
    
    NavigationStack {
        ServiceDetailView(service: service)
    }
}
