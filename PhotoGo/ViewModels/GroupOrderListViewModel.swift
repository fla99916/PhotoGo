//
//  GroupOrderViewModel.swift
//  PhotoGo
//
//  Created by Yelim Kim on 29/7/24.
//

import Foundation
import Combine

@Observable
final class GroupOrderListViewModel {
    private let groupOrderRepository = GroupOrderRepository()
    var isDataAdded = false
    var errorMessage: String?
    var isLoading = false
    
    func add(_ groupOrder: GroupOrder) {
        self.isLoading = true

        groupOrderRepository.add(groupOrder) { result in
            self.isLoading = false
            switch result {
            case .success:
                self.isDataAdded = true
                print("Data added successfully!")
            case .failure(let error):
                self.isDataAdded = false
                self.errorMessage = "Failed to add data: \(error.localizedDescription)"
                print("Failed to add data: \(error.localizedDescription)")
            }
        }
    }
}
