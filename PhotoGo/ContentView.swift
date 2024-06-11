//
//  ContentView.swift
//  PhotoGo
//
//  Created by Yelim Kim on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GroupOrderTableView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
