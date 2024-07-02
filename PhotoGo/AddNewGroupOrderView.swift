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
    
    init() {
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
            .adjustsFontSizeToFitWidth = true
            
    }
    
    var body: some View {
        NavigationStack {
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
                    Button(action: {}) { Text("Add") }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.backward")
                        Text("Cancel") }
                }
                
            }
        }
    }
}

#Preview {
    AddNewGroupOrderView()
}
