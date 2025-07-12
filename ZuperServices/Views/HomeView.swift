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
        
        ZStack(alignment: .topLeading) {
            List(viewModel.filteredServices) { service in
                Button(action: {
                    path.append(service)
                }) {
                    ServiceItemView(service: service)
                }
                .buttonStyle(.plain)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .refreshable(action: {
                await viewModel.onRefresh()
            })
            .scrollIndicators(.hidden)
            .searchable(text: $viewModel.searchText)
            .animation(.default, value: viewModel.filteredServices)
            
            VStack(alignment: .center, spacing: 0) {
                    EmptyStateView
                        .transition(.opacity)
                        .active(if: !viewModel.searchText.isEmpty && viewModel.filteredServices.isEmpty)
            }
            .animation(.easeIn, value: viewModel.filteredServices.isEmpty)
        }
        
    }
    
    @ViewBuilder
    private var EmptyStateView: some View {
        Text("No services found under \(viewModel.searchText).")
            .padding()
    }
    
}

// MARK: - PREVIEW

#Preview {
//    HomeView()
    ContentView()
}
