//
//  ContentView.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import SwiftUI
import ServicesSampleData

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @State private var path = NavigationPath() // Or I can write custom router for navigation
    
    // MARK: - BODY
    
    var body: some View {
        
        NavigationStack(path: $path) {
            HomeView(path: $path)
                .navigationTitle("Services")
                .navigationDestination(for: Service.self, destination: ServiceDetailView.init)
        }
        
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
