//
//  AddNewGroupOrderView.swift
//  PhotoGo
//
//  Created by Yelim Kim on 25/6/24.
//

import SwiftUI

struct AddNewGroupOrderView: View {
    @State private var name: String = ""
    @State private var owner: String = ""
    @Environment(\.dismiss) var dismiss
    @Bindable private var groupOrderListViewModel: GroupOrderListViewModel
    
    init(groupOrderListViewModel: GroupOrderListViewModel) {
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
            .adjustsFontSizeToFitWidth = true
        self.groupOrderListViewModel = groupOrderListViewModel
    }
    
    var body: some View {
        NavigationStack {
            if groupOrderListViewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
            }
            Form {
                Section(header: Spacer(minLength: 0)) {} // ADDED TO ADJUST PADDING TOP
                
                Section {
                    TextField(
                        "Group Order Name...",
                        text: $name)
                    TextField(
                        "Group Order Owner...",
                        text: $owner)
                    
                }
            }
            .padding(.top, -43) // = -63 + 20 (Padding vallue that I want)
            .background(
                Color(UIColor.systemGroupedBackground)
            ) //Set the the above part color
            .navigationTitle("Create New Group Order")
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        groupOrderListViewModel.addGroupOrder(getGroupOrder())
                    }) { Text("Add") }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.backward")
                        Text("Cancel") }
                }
                
            }
            .alert(isPresented: .constant(groupOrderListViewModel.errorMessage != nil)) {
                Alert(title: Text("Error"), message: Text(groupOrderListViewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
            }
            .onChange(of: groupOrderListViewModel.isDataAdded, {
                if groupOrderListViewModel.isDataAdded {
                    dismiss()
                }
            })
            
        }
        
    }
    
    private func getGroupOrder() -> GroupOrder {
        return GroupOrder(
            groupOrderName: name,
            image: "https://fastly.picsum.photos/id/56/2880/1920.jpg?hmac=BIplhYgNZ9bsjPXYhD0xx6M1yPgmg4HtthKkCeJp6Fk",
            owner: owner,
            onCreationDate: Date.now
        )
    }
}

#Preview {
    AddNewGroupOrderView(groupOrderListViewModel: GroupOrderListViewModel())
}
