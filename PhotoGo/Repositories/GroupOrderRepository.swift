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
    
    func add(_ groupOrder: GroupOrder, completion: @escaping (Result<Void, Error>) -> Void)  {
        if let dictionary = groupOrder.toDictionary() {
            store.collection(path).addDocument(data: dictionary) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        }
    }
}
