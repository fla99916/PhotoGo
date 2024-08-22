//
//  GroupOrderViewModel.swift
//  PhotoGo
//
//  Created by Yelim Kim on 12/8/24.
//

import Foundation
import Combine

@Observable
class GroupOrderViewModel: Identifiable {
    private let groupOrderRepository = GroupOrderRepository()
    var groupOrder: GroupOrder
    
    private var cancellables: Set<AnyCancellable> = []
    var id = ""
    
    init(groupOrder: GroupOrder) {
        self.groupOrder = groupOrder
    }
}
