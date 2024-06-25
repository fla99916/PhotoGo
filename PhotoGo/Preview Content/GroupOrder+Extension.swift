//
//  GroupOrder+Extension.swift
//  PhotoGo
//
//  Created by Yelim Kim on 3/6/24.
//

import Foundation

extension GroupOrder {
    static func getPreviewData() -> GroupOrder {
        GroupOrder(
            groupOrderName: "group order1",
            image: "https://farm2.staticflickr.com/1533/26541536141_41abe98db3_z_d.jpg", owner: "Yelim", onCreationDate: Date())
    }
    
    static func getPreviewDataArray() -> [GroupOrder] {
        [
            GroupOrder(groupOrderName: "Chill Hits", image: "https://i.imgur.com/CzXTtJV.jpg", owner: "Yelim", onCreationDate: Date()),
            GroupOrder(groupOrderName: "Indie Mix", image: "https://i.imgur.com/OB0y6MR.jpg", owner: "Yelim", onCreationDate: Date()),
            GroupOrder(groupOrderName: "Hip Hop Vibes", image: "https://farm2.staticflickr.com/1533/26541536141_41abe98db3_z_d.jpg", owner: "Yelim", onCreationDate: Date()),
            GroupOrder(groupOrderName: "Pop Party", image: "https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg", owner: "Yelim", onCreationDate: Date())]
    }
}
