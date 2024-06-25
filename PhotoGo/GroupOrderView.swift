//
//  ContentView.swift
//  PhotoGo
//
//  Created by Yelim Kim on 3/6/24.
//

import SwiftUI

struct GroupOrderView: View {
    let groupOrder: GroupOrder
    
    var body: some View {
        NavigationLink(destination: GroupOrderDetailView(groupOrder: groupOrder)) {
            HStack {
                AsyncImage(url: URL(string: groupOrder.image)) { image in
                    image.resizable()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .cornerRadius(5)
                        .padding(.leading, 8)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading,
                       content: {
                    Text(groupOrder.groupOrderName)
                        .font(.headline)
                        .lineLimit(1)
                    Text(groupOrder.owner)
                        .font(.subheadline)
                        .lineLimit(1)
                    Text(groupOrder.onCreationDate.formatted(.dateTime.day().month().year()))
                        .font(.callout)
                        .lineLimit(1)
                })
                

                Spacer()
            }
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    GroupOrderView(groupOrder: GroupOrder.getPreviewData())
}
