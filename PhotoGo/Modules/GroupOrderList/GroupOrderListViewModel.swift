//
//  GroupOrderViewModel.swift
//  PhotoGo
//
//  Created by Yelim Kim on 29/7/24.
//

import Foundation
import Combine

@MainActor
@Observable
final class GroupOrderListViewModel {
    private let groupOrderRepository = GroupOrderRepository()
    var isDataAdded = false
    var errorMessage: String?
    var isLoading = false
    var groupOrders: [GroupOrder] = []
    
    func loadGroupOrders() {
        Task {
            do {
                let result = try await groupOrderRepository.getGroupOrders()
                
                await MainActor.run {
                    groupOrders = result
                }
                
                print("")
            } catch {
                debugPrint("error getting group orders")
            }
        }
    }
    
    func addGroupOrder(_ groupOrder: GroupOrder) {
        self.isLoading = true

        Task {
            do {
                try await groupOrderRepository.add(groupOrder)
                didEndAddOperation(didSuccess: true)
            } catch {
                didEndAddOperation(didSuccess: false, error: error)
            }
        }
    }
    
    @MainActor
    private func didEndAddOperation(didSuccess: Bool, error: Error? = nil) {
        if let error {
            self.errorMessage = "Failed to add data: \(error.localizedDescription)"
        }
        
        self.isDataAdded = didSuccess
    }
}
