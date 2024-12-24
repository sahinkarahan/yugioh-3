//
//  FrameworkListViewModel.swift
//  yugioh-3
//
//  Created by Şahin Karahan on 13.12.2024.
//
import SwiftUI

@MainActor
final class FrameworkListViewModel: ObservableObject {
    
    @Published var frameworks: [Framework] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedFramework: Framework?
    
    let columns: [GridItem] = [
        GridItem(.flexible())
    ]
    
    func getFrameworks() {
        isLoading = true
        
        Task {
            do {
                frameworks = try await NetworkManager.shared.getFrameworks()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case.invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unabletoComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
