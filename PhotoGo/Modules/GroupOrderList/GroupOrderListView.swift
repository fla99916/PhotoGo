//
//  GroupOrderTableView.swift
//  PhotoGo
//
//  Created by Yelim Kim on 3/6/24.
//

import SwiftUI

@MainActor
struct GroupOrderListView: View {
    @State private var groupOrdersList = GroupOrder.getPreviewDataArray()
    @State private var isAddNewGroupOrderViewActive = false
     private var groupOrderListViewModel = GroupOrderListViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(groupOrderListViewModel.groupOrders) { groupOrder in
                    GroupOrderView(groupOrder: groupOrder)
                }
                .onDelete { indexSet in
                    groupOrdersList.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    groupOrdersList.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .sheet(isPresented: $isAddNewGroupOrderViewActive) {
                AddNewGroupOrderView(
                    groupOrderListViewModel: groupOrderListViewModel
                )
            }.onAppear {
                groupOrderListViewModel.loadGroupOrders()
            }


            .navigationTitle("Group Orders")
            .navigationBarItems(leading: Button(action: {
                self.isAddNewGroupOrderViewActive.toggle()
            } ) {
                Image(systemName: "plus")
                    .resizable()
                    .padding(6)
                    .frame(width: 24, height: 24)
                    .background(.clear)
                    .foregroundColor(.blue)
            }, trailing: EditButton())
            
        }
    }
}

#Preview {
    GroupOrderListView()
}
