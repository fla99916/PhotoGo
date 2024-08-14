//
//  GroupOrderRepository.swift
//  PhotoGo
//
//  Created by Yelim Kim on 29/7/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

enum DefaultError: Error {
    case defaultError
}

class GroupOrderRepository: ObservableObject {
    private let path: String = "GroupOrders"
    private let store = Firestore.firestore()
        
    func add(_ groupOrder: GroupOrder) async throws {
        guard let dictionary = groupOrder.toDictionary() else {
            throw DefaultError.defaultError
        }
        try await store.collection(path).addDocument(data: dictionary)
    }
    
    func getGroupOrders() async throws -> [GroupOrder] {
        let querySnapshot = try await store.collection(path).getDocuments()
        var groupOrders: [GroupOrder] = []
        for document in querySnapshot.documents {
            do {
                let groupOrder = try document.data(as: GroupOrder.self)
                groupOrders.append(groupOrder)
            } catch {
                debugPrint("error getting group order ", error)
            }
        }
        return groupOrders
    }
}
