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
    
    @Published var services: [Service] = []
    @Published var searchText: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        services = SampleData.generateServices()
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    
    
}
