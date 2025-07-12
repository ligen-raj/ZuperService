//
//  HomeViewModel.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import Combine
import Foundation
import ServicesSampleData

class HomeViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    
    @Published private(set) var services: [Service] = []
    @Published private(set) var filteredServices: [Service] = []
    @Published var searchText: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        services = SampleData.generateServices()
        initializeCancellables()
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    private func initializeCancellables() {
        $searchText
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .removeDuplicates()
            .combineLatest($services)
            .sink { [weak self] text, services in
                guard let self else { return }
                
                if text.isEmpty {
                 filteredServices = services
                } else {
                    filteredServices = services.filter { service in
                        service.title.localizedCaseInsensitiveContains(text) ||
                        service.description.localizedCaseInsensitiveContains(text) ||
                        service.customerName.localizedCaseInsensitiveContains(text)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    func onRefresh() async {
        try? await Task.sleep(for: .seconds(.random(in: 2...3)))
        
        services = SampleData.generateServices()
    }
    
}
