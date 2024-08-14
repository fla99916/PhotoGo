//
//  GroupOrder.swift
//  PhotoGo
//
//  Created by Yelim Kim on 3/6/24.
//

import Foundation
import FirebaseFirestoreSwift

struct GroupOrder: Identifiable, Codable {
    @DocumentID var id: String?
    let groupOrderName: String
    let image: String
    let owner: String
    let onCreationDate: Date
}
