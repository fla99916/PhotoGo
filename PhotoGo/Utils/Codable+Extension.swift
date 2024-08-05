//
//  Codable+Extension.swift
//  PhotoGo
//
//  Created by Yelim Kim on 6/8/24.
//

import Foundation

extension Encodable {
    func toDictionary() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] else { return nil }
        return dictionary
    }
}
