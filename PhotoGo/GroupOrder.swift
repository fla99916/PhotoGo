//
//  GroupOrder.swift
//  PhotoGo
//
//  Created by Yelim Kim on 3/6/24.
//

import Foundation

struct GroupOrder: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let owner: String
    let onCreationDate: Date
}
