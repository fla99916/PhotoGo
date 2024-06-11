//
//  GroupOrderTableView.swift
//  PhotoGo
//
//  Created by Yelim Kim on 3/6/24.
//

import SwiftUI

struct GroupOrderTableView: View {
    @State private var groupOrdersList = GroupOrder.getPreviewDataArray()
    
    var body: some View {
        List {
            ForEach(groupOrdersList) { groupOrder in
                GroupOrderView(groupOrder: groupOrder)
            }
            .onDelete { indexSet in
                groupOrdersList.remove(atOffsets: indexSet)
            }
            .onMove { indices, newOffset in
                groupOrdersList.move(fromOffsets: indices, toOffset: newOffset)
            }
        }
        .navigationTitle("Group Orders")
        .navigationBarItems(trailing: EditButton())
    }
}

#Preview {
    GroupOrderTableView()
}
