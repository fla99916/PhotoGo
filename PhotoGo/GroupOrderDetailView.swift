//
//  GroupOrderDetailView.swift
//  PhotoGo
//
//  Created by Yelim Kim on 3/6/24.
//

import SwiftUI

struct GroupOrderDetailView: View {
    let groupOrder: GroupOrder
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    AsyncImage(url: URL(string: groupOrder.image)) { image in
                        image.resizable()
                            .frame(maxWidth: proxy.size.width, maxHeight: proxy.size.width)
                            .cornerRadius(10)
                            .padding()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(groupOrder.image)
                        .font(.largeTitle)
                        .padding(.bottom, 10)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis massa et eros volutpat posuere a vel nisl.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                }
            }
            .navigationTitle(groupOrder.image)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    GroupOrderDetailView(groupOrder: GroupOrder.getPreviewData())
}
