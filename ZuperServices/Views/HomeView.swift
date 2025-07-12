//
//  HomeView.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - PROPERTIES
    
    @StateObject private var viewModel = HomeViewModel()
    
    @Binding var path: NavigationPath
    
    // MARK: - BODY
    
    var body: some View {
        
        List(viewModel.services) { service in
            Button(action: {
                path.append(service)
            }) {
                ServiceItemView(service: service)
            }
            .buttonStyle(.plain)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .searchable(text: $viewModel.searchText)
        
    }
}

// MARK: - PREVIEW

#Preview {
//    HomeView()
    ContentView()
}
